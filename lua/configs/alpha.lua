local M = {}
function M.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("r", " Recently used files", ":Telescope oldfiles<CR>"),
		dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
		dashboard.button("t", " Find text", ":Telescope live_grep <CR>"),
		dashboard.button(
			"s",
			" Settings",
			":e $HOME/.config/nvim/init.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"
		),
		dashboard.button("q", " Quit NVIM", ":qa<CR>"),
	}

	-- Set footer
	--local handle = assert(io.popen("fortune -s"))
	--local fortune = handle:read("*all")
	--handle:close()
	--dashboard.section.footer.val = fortune
	dashboard.section.header.opts.hl = "Title"
	dashboard.section.buttons.opts.hl = "Debug"
	dashboard.section.footer.opts.hl = "Conceal"
	dashboard.config.opts.noautocmd = true

	alpha.setup(dashboard.opts)

	dashboard.section.header.val = {
		[[ __      _______ __  __  ]],
		[[ \ \    / /_   _|  \/  | ]],
		[[  \ \  / /  | | | \  / | ]],
		[[   \ \/ /   | | | |\/| | ]],
		[[    \  /   _| |_| |  | | ]],
		[[     \/   |_____|_|  |_| ]],
		[[                         ]],
		[[                         ]],
	}
end

return M
