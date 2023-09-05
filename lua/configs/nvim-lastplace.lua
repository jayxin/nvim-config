local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'nvim-lastplace')
  if not status_ok then return end

  _.setup({
    lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
    lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
    lastplace_open_folds = true,
  })
end

return M
