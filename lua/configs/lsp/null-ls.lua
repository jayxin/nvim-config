local M = {}

function M.config()
	local status_ok, _ = pcall(require, "null-ls")
	if not status_ok then
		return
	end

	local command_resolver = require("null-ls.helpers.command_resolver")

	local formatting = _.builtins.formatting
	local diagnostics = _.builtins.diagnostics
	local actions = _.builtins.code_actions
	local hover = _.builtins.hover

	local sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		--formatting.black.with({ extra_args = { "--fast" } }),
		formatting.goimports,
		formatting.gofumpt,
		diagnostics.golangci_lint,
		formatting.rustfmt,
		--formatting.stylua,

		-- python
		--formatting.black,
		formatting.isort,
		diagnostics.flake8,
		--diagnostics.pylint,

		-- sh
		formatting.shfmt.with({
			extra_args = { "-i", "2", "-bn", "-ci", "-sr" },
		}),
		diagnostics.shellcheck,

		-- markdown
		--diagnostics.markdownlint,
		--formatting.markdownlint,

		-- javascript
		formatting.eslint.with({
			dynamic_command = function(params)
				return command_resolver.from_yarn_pnp(params)
					or command_resolver.from_node_modules(params)
					or vim.fn.executable(params.command) == 1 and params.command
			end,
		}),
		actions.eslint.with({
			dynamic_command = function(params)
				return command_resolver.from_yarn_pnp(params)
					or command_resolver.from_node_modules(params)
					or vim.fn.executable(params.command) == 1 and params.command
			end,
		}),

		diagnostics.eslint.with({
			dynamic_command = function(params)
				return command_resolver.from_yarn_pnp(params)
					or command_resolver.from_node_modules(params)
					or vim.fn.executable(params.command) == 1 and params.command
			end,
		}),

		_.builtins.completion.spell,
		diagnostics.rubocop,
		actions.gitsigns,
		hover.dictionary,
	}

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	_.setup({
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ timeout_ms = 2000 })
					end,
				})
			end
		end,
	})
end

return M
