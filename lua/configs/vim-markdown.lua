local M = {}

function M.config()
  --vim.g.vim_markdown_toc_autofit = 1

  vim.g.vim_markdown_math = 1

  --vim.g.vim_markdown_folding_disabled = 1
  --vim.g.vim_markdown_folding_style_pythonic = 1
  --vim.g.vim_markdown_folding_level = 1 -- 1-6
  --vim.g.vim_markdown_override_foldtext = 0

  --vim.g.vim_markdown_emphasis_multiline = 1

  --vim.g.vim_markdown_strikethrough = 1

  vim.o.conceallevel = 0
  --vim.g.vim_markdown_conceal_code_blocks = 1
  -- cs as csharp and py as python
  --vim.g.vim_markdown_fenced_languages = {'csharp=cs', 'python=py'}

  -- default key
  --vim.g.vim_markdown_no_default_key_mappings = 0

  vim.g.vim_markdown_auto_insert_bullets = 0

  -- Adjust new list item indent to 2 space (4 by default)
  vim.g.vim_markdown_new_list_item_indent = 0

  -- auto write when `ge`
  --vim.g.vim_markdown_autowrite = 1

  -- how to open new files when `ge` options: tab, vsplit, hsplit, current(by default)
  --vim.g.vim_markdown_edit_url_in = 'vsplit'
end

return M
