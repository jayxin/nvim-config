local M = {}

local nnoremap = function(lhs, rhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", lhs, rhs, bufopts)
end

M.on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  nnoremap("gD", vim.lsp.buf.declaration   , bufopts, "Go to declaration")
  nnoremap("gd", vim.lsp.buf.definition    , bufopts, "Go to definition")
  nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  nnoremap("gr", vim.lsp.buf.references    , bufopts, "References")
  nnoremap("gh", vim.lsp.buf.hover         , bufopts, "Hover text")

  nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")

  nnoremap("<Leader>aw", vim.lsp.buf.add_workspace_folder   , bufopts, "Add workspace folder")
  nnoremap("<Leader>rw", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  nnoremap("<Leader>lw", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts, "List workspace folders")

  nnoremap("<Leader>D" , vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  nnoremap("<Leader>rn", vim.lsp.buf.rename         , bufopts, "Rename")

  nnoremap("<Leader>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set(
    "v",
    "<Leader>ca",
    "<Esc><Cmd>lua vim.lsp.buf.range_code_action()<Cr>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
  )

  nnoremap("<Leader>F", function()
    vim.lsp.buf.format { async = true }
  end, bufopts, "Format file")

  local opts = { noremap = true, silent = true }

  nnoremap("go"       , vim.diagnostic.open_float, opts, "Open float")
  nnoremap("gp"       , vim.diagnostic.goto_prev , opts, "Prev diag")
  nnoremap("gn"       , vim.diagnostic.goto_next , opts, "Next diag")
  nnoremap("<Leader>q", vim.diagnostic.setloclist, opts, "Set loc list")
end

return M
