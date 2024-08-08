local M = {}

function M.config()
  vim.keymap.set("n", "<leader>tb", ":TagbarToggle<CR>")
  vim.g.tagbar_ctags_bin = '/usr/bin/ctags'
  vim.g.tagbar_width = 30

  --[[local agrp = vim.api.nvim_create_augroup
  local acmd = vim.api.nvim_create_autocmd

  acmd("BufReadPost", {
    pattern = {"*.cpp", "*.c", "*.h", "*.hpp", "*.cc"},
    group = agrp("TagBar", { clear = true }),
    command = "TagbarOpen",
  })]]
end

return M
