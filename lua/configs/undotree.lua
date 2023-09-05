local M = {}

function M.config()
  vim.keymap.set('n', '<Leader>ut', ':UndotreeToggle<Cr>', { noremap=true, silent=true })
end

return M
