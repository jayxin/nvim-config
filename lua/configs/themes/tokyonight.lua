local M = {}

function M.config()
  vim.cmd('packadd tokyonight.nvim')
  local status_ok, _ = pcall(require, 'tokyonight')
  if not status_ok then return end

  _.setup({
  styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = 'dark',
        floats = 'dark',
      },
  })

  vim.g.tokyonight_style = 'moon'
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_italic_comments = false

  vim.cmd('colo tokyonight-moon')

  vim.cmd([[
  hi StatusLine gui=BOLD guifg=White guibg=RoyalBlue4 cterm=BOLD ctermfg=White ctermbg=DarkBlue
  hi StatusLineNC gui=BOLD guifg=Bisque guibg=DimGray cterm=BOLD ctermfg=Black ctermbg=Gray
  ]])
end

return M
