local on_attach = function(client, bufnr)
  require("configs.lsp.keymaps").on_attach(client, bufnr);
end

-- add completion capability
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("lspconfig").lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      local settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        -- Make the server aware of Neovim runtime files
        workspace = {
          vim.api.nvim_get_runtime_file("", true)
        },
      })
      client.notify("workspace/didChangeConfiguration", { settings = settings })
    end
    return true
  end,

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        --library = { vim.env.VIMRUNTIME },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
})
