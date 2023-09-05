local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'toggleterm')
  if not status_ok then return end

  local opt = _.setup({
      open_mapping = [[<C-\>]],
      start_in_insert = true,
      direction = 'horizontal',
      --direction = 'float'
      -- vertical/float/tab
  })

  local Terminal = require('toggleterm.terminal').Terminal
  function python_toggle()
    local pyterm = Terminal:new({
      cmd = 'python',
      direction = 'horizontal'
    })
    pyterm:toggle()
  end

  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<Leader>tt', '<Cmd>ToggleTerm<Cr>', opts)
  vim.keymap.set('n', '<Leader>py', ':lua python_toggle()<Cr>', opts)
end

return M
