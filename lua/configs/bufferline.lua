local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'bufferline')
  if not status_ok then return end

  local l = '<Leader>'
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', l .. 'bg', ':BufferLinePick<Cr>'                              , opts)
  vim.keymap.set('n', l .. 'bp', ':BufferLinePickClose<Cr>'                         , opts)
  vim.keymap.set('n', l .. 'bo', ':BufferLineCloseLeft<Cr>:BufferLineCloseRight<Cr>', opts)
  vim.keymap.set('n', 'gt'     , ':BufferLineCycleNext<Cr>'                         , opts)
  vim.keymap.set('n', 'gT'     , ':BufferLineCyclePrev<Cr>'                         , opts)

  vim.opt.termguicolors = true

  _.setup({
    options = {
      number = 'none', -- ordinal
      mode = 'buffer',
      --mode = 'tabs', -- 只显示真实的tabs不显示buffer
      max_name_length = 6,
      max_prefix_length = 6,
      tab_size = 10,

      modified_icon           = '✥',
      left_trunc_marker       = '',
      right_trunc_marker      = '',
      show_buffer_close_icons = false,
      show_buffer_icons       = true,
      show_tab_indicators     = true,

      diagnostics            = 'nvim_lsp',
      always_show_bufferline = true,
      separator_style        = 'thin',

      offsets = {
        {
          filetype   = 'NvimTree',
          text       = 'File Explorer',
          text_align = 'center',
          highlight  = 'Directory',
          padding    = 1,
        },
      },
    },
  })
end

return M
