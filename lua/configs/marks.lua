local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'marks')
  if not status_ok then return end

  _.setup({
    default_mappings = false,
    builtin_marks = { '.', '<', '>', '^' },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 350,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    --excluded_filetypes = {},

    -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
    -- sign/virttext. Bookmarks can be used to group together positions and quickly move
    -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
    -- default virt_text is ''.
    bookmark_0 = {
      sign = '⚑',
      virt_text = '',
      -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
      -- defaults to false.
      annotate = false,
    },
    mappings = {
      set = 'm',
      delete = 'dm',
      set_next = 'm,',
      delete_buf = 'dm<space>',
      next = 'm]',
      prev = 'm[',
      preview = 'm:',
    },
  })
end

return M
