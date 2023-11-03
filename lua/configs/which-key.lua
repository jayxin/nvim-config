local M = {}

function M.config()
  local status_ok, _ = pcall(require, 'which-key')
  if not status_ok then return end

  _.setup({
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
      spelling = { enabled = true, suggestions = 20 },
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
  })

  --_.register({
        ----['<Leader>f'] = { name = '+file' },
        --['<Leader>fb'] = { '<Cmd>Telescope buffers<cr>', 'Find Buffers' },
        --['<Leader>ff'] = { '<Cmd>Telescope find_files<cr>', 'Find Files' },
        --['<Leader>fg'] = { '<Cmd>Telescope git_files<cr>', 'Git Files' },
        --['<leader>fj'] = { '<Cmd>Telescope jumplist<cr>', 'Jump List' },
        --['<leader>fl'] = { '<Cmd>Telescope live_grep<cr>', 'Live Grep' },
        --['<leader>fm'] = { '<Cmd>Telescope marks<cr>', 'Find Marks' },
        --['<Leader>fr'] = { '<Cmd>Telescope oldfiles<cr>', 'Open Recent File' },
        --['<leader>fs'] = { '<Cmd>Telescope grep_string<cr>', 'Grep String' },
        --['<leader>ft'] = { '<Cmd>NvimTreeToggle<cr>', 'File Tree' },
  --})
end

return M
