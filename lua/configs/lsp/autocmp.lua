local M = {}

function M.config()
	vim.opt.completeopt = { "menu", "menuone", "noselect" }
	local cmp = require("cmp")
	local select_opts = { behavior = cmp.SelectBehavior.Select }
	local luasnip = require("luasnip")

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	-- kind_icons{{
	local kind_icons = {
		Class = "∴",
		Color = "🖌", -- ☀
		Constant = "𝜋", -- π
		Constructor = "⬡", -- ⚙
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "", -- →
		File = "",
		Folder = "",
		Function = "ƒ", -- λ
		Interface = "",
		Keyword = "🗝",
		Method = "𝘮", -- λ
		Module = "", -- 📦
		Operator = "≠", -- ±
		Property = "∷", -- ::
		Reference = "⊷", -- ⊶
		Snippet = "{}", --  ♢ <>
		Struct = "", -- 
		Text = "𝓣", -- # ¶ ¶ 𝒯
		TypeParameter = "×",
		Unit = "()",
		Variable = "𝓧", -- 𝛼 𝛸 α ≔
	}
	--}}

	cmp.setup({
		preselect = cmp.PreselectMode.None,

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		-- cmp sources configuration{{
		sources = cmp.config.sources({
			{ name = "nvim_lsp", keyword_length = 1 }, -- Lang server
			{ name = "luasnip", keyword_length = 2 }, -- snippets
			{
				name = "buffer",
				keyword_length = 3,
				option = {
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "treesitter" },
			{
				name = "latex_symbols",
				option = {
					strategy = 0, -- mixed
				},
			},
			{ name = "calc" },
			{ name = "path" }, -- File path
			{ name = "nvim_lua" },
			{ name = "spell" },
		}),
		--}}

		-- Window conf{{
		window = {
			completion = {
				border = "rounded",
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			},
			documentation = {
				border = "rounded",
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
			},
		},
		--}}

		experimental = {
			ghost_text = false,
		},

		-- formatting conf{{
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, item)
				local menu_icon = {
					omni = (vim.inspect(item.menu):gsub('%"', "")),
					nvim_lsp = "[LSP]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					spell = "[Spell]",
					latex_symbols = "[Symbols]",
					cmdline = "[CMD]",
					path = "[Path]",
				}
				-- Kind icons
				item.kind = string.format("%s", kind_icons[item.kind])
				-- item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

				item.menu = menu_icon[entry.source.name]
				return item
			end,
			--}),
		},
		--}}

		-- mapping conf{{
		mapping = cmp.mapping.preset.insert({
			["<Up>"] = cmp.mapping.select_prev_item(select_opts),
			["<Down>"] = cmp.mapping.select_next_item(select_opts),

			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),

			[",a"] = cmp.mapping.abort(),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			--['<CR>'] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Replace,
			--select = true,
			--}),
			["<C-l>"] = cmp.mapping.complete(),

			["<C-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.jumpable(1) then
					luansip.jump(1)
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luansip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
				elseif luasnip.expand_or_jumpable() then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		--}}

		-- enable catppuccin integration{{
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		--}}
	})

	-- Use buffer source for / and ?{{
	-- If you enabled native_menu, this won't work anymore.
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
	--}}

	-- Use cmdline & path source for ':'{{
	-- If you enabled native_menu, this won't work anymore.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
	--}}

	-- Set configuration for specific file type{{
	--cmp.setup.filetype('gitcommit', {
	--  sources = cmp.config.sources({
	--    { name = 'cmp_git' },
	--    -- You can specify the cmp_git source if you were installed it.
	--  }, {
	--    { name = 'buffer' },
	--  }),
	--})
	--}}
end

return M

-- vim: foldmarker={{,}} foldmethod=marker
