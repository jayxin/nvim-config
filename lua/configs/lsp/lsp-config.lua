-- Requirements:{{
-- 1. Neovim v0.8 or greater is recommended.
-- 2. An LSP server.
-- 3. Install nvim-lspconfig
-- 4. Install plugins for autocompletion:
-- nvim-cmp
-- cmp-buffer
-- cmp-path
-- cmp_luasnip
-- cmp-nvim-lsp
-- LuaSnip
-- friendy-snippets
--}}

-- Global config
local M = {}

function M.config()
  local lspconfig = require("lspconfig")

  local lsp_defaults = lspconfig.util.default_config
  lsp_defaults.capabilities =
      vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

  local lsp_flags = { -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded"
  })

  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  -- The lazy_load function will load any snippet we have in our runtimepath.
  --require("luasnip.loaders.from_vscode").lazy_load()

  --vim.api.nvim_create_autocmd("LspAttach", {
  --desc = "LSP actions",
  --callback = function()
  --end,
  --})

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    require("configs.lsp.keymaps").on_attach(client, bufnr);
  end

  local servers = {
    --"clangd",
    "pyright",
    --"rust_analyzer",
    --"lua_ls",
    "cmake",
    --"cssls",
    --"vuels",
    --"dockerls",
    "gopls",
    "html",
    --"jsonls",
    --"sqlls",
    --"yamlls",
    "quick_lint_js",
    --"tsserver",
    --"rome",
    --"texlab",
    --"jdtls",
  }

  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      --single_file_support = true,
      capabilities = lsp_defaults.capabilities,
    })
  end

  local lsp_defaults = lspconfig.util.default_config
  lsp_defaults.capabilities =
      vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())
  lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, {
    offsetEncoding = { "utf-16" },
    general = {
      positionEncodings = { "utf-16" },
    },
  })
  lspconfig["clangd"].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = lsp_defaults.capabilities,
  })
  -- LSP Servers
end

return M
-- vim: foldmarker={{,}} foldmethod=marker
