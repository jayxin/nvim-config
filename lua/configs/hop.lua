local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'hop')
  if not status_ok then return end

  local opts = { remap = true }
  local directions = require('hop.hint').HintDirection

  _.setup { keys = 'etovxqpdygfblzhckisuran' }

  vim.keymap.set('', 's', function()
    _.hint_char1({ direction = directions.AFTER_CURSOR })
  end, opts)
  vim.keymap.set('', 'S', function()
    _.hint_char1({ direction = directions.BEFORE_CURSOR })
  end, opts)
  --vim.keymap.set('', 't', function()
  --  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  --end, {remap=true})
  --vim.keymap.set('', 'T', function()
  --  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  --end, {remap=true})
end

return M
