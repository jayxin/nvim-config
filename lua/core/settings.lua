vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python_provider = 0

vim.g.loaded = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1

vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "~/py/bin/python3"

--vim.opt.nu = true
vim.o.relativenumber = true
vim.o.shiftround = true
vim.o.cursorline = true
vim.o.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.showcmd = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true

vim.o.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp396,latin1"
--vim.opt.guifont = "Cascadia_Code_PL:h12"
vim.o.autowrite = true
vim.o.textwidth = 80
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
--vim.opt.foldlevel = 99

vim.opt.autochdir = true
--vim.opt.clipboard = 'unnamedplus'
--vim.opt.completeopt = {"menu", "menuone", "noselect"} -- mostly just for cmp
vim.opt.signcolumn = "yes"
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.backup = false

vim.opt.backspace = "indent,eol,start"
vim.opt.showbreak= '↪' -- character to show when line is broken

vim.cmd([[ set shortmess+=c ]])
vim.cmd([[ set shortmess+=I ]])
vim.opt.whichwrap:append({
  ["<"] = true,
  [">"] = true,
  [","] = true,
  h = true,
  l = true,
})
vim.cmd([[ set iskeyword+=- ]])

-- persistent undo
vim.bo.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/tmp/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.opt.spell = true
vim.opt.spelllang = { "en_us", "cjk" }

vim.o.timeoutlen = 300
vim.opt.ttimeout = true
vim.o.ttimeoutlen = 100

vim.o.history = 500

--vim.o.laststatus = 2
--vim.o.statusline = "%f%m%r %=L:%l/%L %c %p%% " .. vim.opt.fileformat._value .. " " .. vim.o.encoding .. "|%y"
--vim.o.winbar = "%f"

vim.g.border_style = "rounded"
--vim.opt.showtabline = 2 -- always show tabs

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.opt.startofline = true

-- display
vim.opt.scrolloff = 3 -- always show 3 rows from edge of the screen
vim.opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance

vim.opt.list = false
vim.opt.eol = false -- show if there's no eol char

if vim.fn.has('nvim') then
  vim.cmd([[
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
  ]])
end

-- vim: foldmarker={{,}} fdm=marker
