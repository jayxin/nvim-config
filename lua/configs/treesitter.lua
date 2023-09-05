local M = {}

M.config = function()
  local status_ok, _ = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  local parser_path = vim.fn.stdpath("state") .. "/treesitter-parser"

  vim.opt.runtimepath:append(parser_path)
  _.setup({
    ensure_installed = {
      "javascript",
      "typescript",
      "html",
      "css",
      "vim",
      "lua",
      "rust",
      "c",
      "cpp",
      "python",
      "bash",
      "go",
      "gomod",
      "make",
      "cmake",
      "markdown",
      "markdown_inline",
      "gitignore",
      "json",
      "latex",
      "sql",
      "vue",
      "yaml",
      "regex",
    },
    sync_install = false,
    auto_install = true,
    parser_install_dir = parser_path,
    highlight = {
      enable = true,
      --disable = {},
      --disable = function(lang, buf)
      --local max_filesize = 100 * 1024 -- 100 KB
      --local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      --if ok and stats and stats.size > max_filesize then
      --return true
      --end
      --end,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Cr>",
        node_incremental = "<Cr>",
        node_decremental = "<Bs>",
        scope_incremental = "<Tab>",
      },
    },
    indent = {
      enable = true,
    },
    ignore_install = {},
    --rainbow = {
    --enable = true,
    ---- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    --extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --colors = {
    --"#cc241d",
    --"#a89984",
    --"#b16286",
    --"#d79921",
    --"#689d6a",
    --"#d65d0e",
    --"#458588",
    --}, -- table of hex strings
    --termcolors = {
    --"Red",
    --"Green",
    --"Yellow",
    --"Blue",
    --"Magenta",
    --"Cyan",
    --"White",
    --}, -- table of colour name strings
    --},
  })

  vim.wo.foldmethod = "expr"
  vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
  vim.wo.foldlevel = 99
end

return M
