local agrp = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

-- Last place{{
vim.cmd([[
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
]])
--}}

-- Fold{{
--acmd("BufReadPost", {
--pattern = "*",
----command = 'setlocal foldmethod=marker'
--command = "setlocal foldmethod=indent",
--})

acmd("BufReadPost", {
	pattern = vim.fn.stdpath("config") .. "/**/*.lua",
	command = "normal zM",
})
--}}

-- Disable automatic comment on newline{{
acmd("FileType", {
	pattern = "*",
	group = agrp("REMOVE_COMMENT", { clear = true }),
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})
--}}

-- Highlight yanked text{{
acmd("TextYankPost", {
	group = agrp("YANK_HIGHLIGHT", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})
--}}

-- STRIP_BLANK{{
local stripBlank = agrp("STRIP_BLANK", { clear = false })
acmd({ "BufWritePre" }, {
	pattern = { "*" },
	group = stripBlank,
	callback = function()
		if vim.o.ft == "markdown" then
			return
		end
		vim.cmd([[ %s/\s\+$//e ]])
	end,
})
--acmd({'BufWritePre'}, {
--  pattern = {'*'},
--  group = stripBlank,
--  command = '%s/\\n\\+\\%$//e'
--})
--acmd({'BufWritePre'}, {
--  pattern = {'*.[ch]'},
--  group = stripBlank,
--  command = '%s/\\%$/\\r/e'
--})

--vim.cmd [[
--fun! StripTrailingWhitespace()
--    if &ft =~ 'markdown'
--        return
--    endif
--    %s/\s\+$//e
--endfun
--autocmd BufWritePre * call StripTrailingWhitespace()
--]]
--}}

acmd({ "InsertEnter" }, {
	pattern = "*",
	command = "setlocal formatoptions+=t formatoptions-=l",
})

acmd("BufEnter", {
	pattern = "*",
  callback = function ()
    vim.o.laststatus = 2
    vim.o.statusline = "%f%m%r %=L:%l/%L %c %p%% " .. vim.opt.fileformat._value .. " " .. vim.o.encoding .. "|%y"
    vim.o.winbar = "%f"
  end
})

-- vim: foldmarker={{,}} fdm=marker
