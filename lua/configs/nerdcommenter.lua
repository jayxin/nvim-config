local M = {}

function M.config()
  vim.g.NERDCreateDefaultMappings = 1
  vim.g.NERDCommentWholeLinesInVMode = 1
  vim.api.nvim_set_keymap("", "<Leader>c<Space>", "<Plug>NERDCommenterToggle", {noremap = true, silent = true})
end

return M
