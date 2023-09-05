local M = {}

function M.load()
  vim.keymap.set('n', '<Leader>gs', vim.cmd.Git, { remap = true })

  require('configs/gitsigns').config()
end

function M.config()
  vim.keymap.set('n', '<Leader>gs', ':lua require("configs/git").load()<Cr>', { silent = true })
end

return M
