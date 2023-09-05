--vim.o.background = 'light'
vim.o.background = 'dark'

-- for CopilotSuggestion
--vim.cmd("highlight CopilotSuggestion guifg=#555555 ctermfg=8")

local M = {}
function M.config()
  local status_ok, _ = pcall(require, 'gruvbox')
  if not status_ok then
    vim.notify('colorscheme gruvbox not found!')
    return
  end

  _.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "soft", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = true,
    transparent_mode = false,
  })

  vim.cmd('colorscheme gruvbox')
end

return M
