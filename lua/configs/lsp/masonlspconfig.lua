local M = {}
function M.config()
  local status_ok, _ = pcall(require, 'mason-lspconfig')
  if not status_ok then return end

  _.setup({
    ensure_installed = {
      'lua_ls',
      -- use rustup instead install this directly
      --'rust_analyzer',
      'clangd',
      'cmake',
      'cssls',
      'gopls',
      'html',
      'jsonls',
      'quick_lint_js',
      --'texlab',
      'marksman',
      'pyright',
      'sqlls',
      'taplo',
      'vimls',
      'vuels',
      'yamlls',
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { 'rust_analyzer', 'solargraph' } }
    automatic_installation = true,
  })
end

return M
