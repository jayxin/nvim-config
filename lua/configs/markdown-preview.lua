local M = {}

function M.config()
  local keymap = require("utils.keymap").map

  -- if do not work in .md file,
  -- please do `:call mkdp#util#install()`

  vim.g.mkdp_theme = 'light'

  vim.g.mkdp_open_to_the_world = 1

  -- auto close preview when leaving .md buffer
  --vim.g.mkdp_auto_close = 1
  vim.g.mkdp_auto_close = 0

  vim.g.mkdp_page_title = 'Document'
  vim.g.mkdp_port = '5589'
  vim.g.mkdp_auto_start = 0

  -- auto refresh preview
  vim.g.mkdp_refresh_slow = 0

  -- only .md file
  vim.g.mkdp_command_for_global = 0

  -- echo preview page url in command line
  -- when open preview page
  vim.g.mkdp_echo_preview_url = 1

  -- a custom vim function name to open preview page
  -- this function will receive url as param
  -- default is empty
  --vim.g.mkdp_browserfunc = ''

  -- recognized filetypes
  -- these filetypes will have MarkdownPreview... commands
  vim.g.mkdp_filetypes = {'markdown'}

  -- use custom IP to open preview page
  -- useful when you work in remote vim and preview on local browser
  -- more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  --vim.g.mkdp_open_ip = "127.0.0.1"

  --vim.g.mkdp_path_to_chrome = 'chrome'
  --vim.g.mkdp_browser = 'Google Chrome'

  -- preview page title
  -- ${name} will be replace with the file name
  vim.g.mkdp_page_title = '${name}'

  -- use a custom markdown style must be absolute path
  -- like '/home/username/markdown.css' or expand('~/markdown.css')
  --vim.g.mkdp_markdown_css = ''
  --vim.g.mkdp_markdown_css =
  --'/home/test1/.config/nvim/after/ftplugin/markdown/css/1.css'

  -- use a custom highlight style must be absolute path
  -- like '/home/username/highlight.css' or expand('~/highlight.css')
  --vim.g.mkdp_highlight_css = ''

  --vim.keymap.set('n', '<Leader>mp', ':MarkdownPreview<Cr>', opts)
  --vim.keymap.set('n', '<Leader>me', ':MarkdownPreviewStop<Cr>', opts)

  keymap('n', '<Leader>mp', ':call mkdp#rpc#start_server()<Cr>', ".md Preview")
  keymap('n', '<Leader>me', ':call mkdp#rpc#stop_server()<Cr>', ".md Previw Stop")
end

return M


-- options for markdown render
-- mkit: markdown-it options for render
-- katex: katex options for math
-- uml: markdown-it-plantuml options
-- maid: mermaid options
-- disable_sync_scroll: if disable sync scroll, default 0
-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
--   middle: mean the cursor position always show at the middle of the preview page
--   top: mean the vim top viewport always show at the top of the preview page
--   relative: mean the cursor position always show at the relative position of the preview page
-- hide_yaml_meta: if hide yaml metadata, default is 1
-- sequence_diagrams: js-sequence-diagrams options
-- content_editable: if enable content editable for preview page, default: v:false
-- disable_filename: if disable filename header for preview page, default: 0
--vim.cmd[[
--let g:mkdp_preview_options = {
    --\ 'mkit': {},
    --\ 'katex': {},
    --\ 'uml': {},
    --\ 'maid': {},
    --\ 'disable_sync_scroll': 0,
    --\ 'sync_scroll_type': 'middle',
    --\ 'hide_yaml_meta': 1,
    --\ 'sequence_diagrams': {},
    --\ 'flowchart_diagrams': {},
    --\ 'content_editable': v:false,
    --\ 'disable_filename': 0
    --\ }
--]]
