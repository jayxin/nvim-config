local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'lualine')
  if not status_ok then return end

  _.setup({
    options = {
      theme = 'gruvbox',
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 3,
          symbols = {
            modified = "[+]",
            readonly = "[-]",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "fzf", "quickfix", "nvim-tree", "nvim-dap-ui", "aerial" },
  })
end

return M
