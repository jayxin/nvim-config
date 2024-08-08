local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

local status_ok, _ = pcall(require, "lazy")
if not status_ok then
  return
end

return _.setup({
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons", lazy = true },

  -- Text {{{
  --{
  --'ethanholz/nvim-lastplace',
  --config = function()
  --require("configs.nvim-lastplace").config()
  --end,
  --},
  { "mg979/vim-visual-multi" },
  { "scrooloose/nerdcommenter",     lazy = false },
  {
    "jiangmiao/auto-pairs",
    config = function()
      vim.cmd([[
        let g:AutoPairsShortcutToggle = ''
      ]])
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("configs.hop").config()
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      require("configs.undotree").config()
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("configs.surround").config()
    end,
  },
  --{
  --'folke/flash.nvim',
  --event = 'VeryLazy',
  --config = function()
  --require('configs.flash').config()
  --end,
  --},
  -- }}}

  -- Code Analysis {{{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("configs.treesitter").config()
    end,
    dependencies = {
      { "p00f/nvim-ts-rainbow" },
    },
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("configs.aerial").config()
    end,
  }, -- Code outline
  --use { 'chentoast/marks.nvim' }
  --}}}

  -- Finder {{{
  { "BurntSushi/ripgrep" },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
      require("configs.telescope").config()
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-treesitter/nvim-treesitter",
        build = function()
          require("nvmi-treesitter.install").update({ with_sync = true })
        end,
      },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yank_history")
      require("yanky").setup({})
    end,
  },
  {
    "nvim-telescope/telescope-bibtex.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("bibtex")
    end,
  },
  --}}}

  -- Components {{{
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.bufferline").config()
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    version = "nightly",
    config = function()
      require("configs.nvim-tree").config()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = function()
      require("configs.toggleterm").config()
    end,
  },
  --}}}

  -- LSP {{{
  {
    "williamboman/mason.nvim",
    config = function()
      require("configs.lsp.mason").config()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("configs.lsp.masonlspconfig").config()
    end,
  },

  -- A convenient layer for native LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lsp.lsp-config").config()
      require("configs.lsp.autocmp").config()
      require("configs.lsp.diagnostic").config()
    end,
    dependencies = {
      { "hrsh7th/nvim-cmp" },  -- Autocompletion plugin
      { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lua" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-calc" },
      { "kdheepak/cmp-latex-symbols" },
      { "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("configs.lsp.luasnip").config()
        end,
        dependencies = {
          { "rafamadriz/friendly-snippets" },
        },
      }, -- Snippets plugin
      { "ray-x/cmp-treesitter" },
      { "onsails/lspkind.nvim" },
    },
  },

  -- lsp signature
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      --require("configs.lsp.lsp_signature").config()
    end,
  },

  -- auto format
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.lsp.null-ls").config()
    end,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- languages
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap").config()
    end,
  },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui" },
  -- golang
  {
    "olexsmir/gopher.nvim",
    config = function()
      require("configs.lsp.gopher").config()
    end,
  },
  { "leoluz/nvim-dap-go" },
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require("configs.lsp.rust-tools").config()
    end,
    dependencies = { "neovim/nvim-lspconfig", "ray-x/lsp_signature.nvim" },
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  -- }}}

  -- git {{{
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("configs.git").config()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  -- }}}

  -- Markdown {{{
  {
    "godlygeek/tabular",
    --ft = { "markdown" },
  },
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    --dependencies = {
    --{ "dhruvasagar/vim-table-mode" },
    --},
  },
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
  },
  -- }}}

  -- LaTeX {{{
  {
    "lervag/vimtex",
    config = function()
      require("configs.vimtex").config()
    end,
    --ft = { "tex" },
  },
  --{ 'KeitaNakamura/tex-conceal.vim' }
  {
    "jbyuki/nabla.nvim",
    config = function()
      --require("configs.nabla").config()
    end,
  },
  --}}}

  -- UI {{{
  --{
  --'nvim-lualine/lualine.nvim',
  --dependencies = {'kyazdani42/nvim-web-devicons'},
  --config = function()
  --require('configs.lualine').config()
  --end,
  --},

  -- dashboard
  {
    "goolord/alpha-nvim",
    config = function()
      require("configs.alpha").config()
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("configs.scrollbar").config()
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("configs.todo-comments").config()
    end,
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require("configs.fidget").config()
    end,
    -- to avoid break changes
    tag = "legacy",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.indent-blankline").config()
    end,
  },

  --{
  --'mhinz/vim-startify',
  --config = function()
  --require('configs.vim-startify').config()
  --end,
  --},

  -- marks
  {
    "chentoast/marks.nvim",
    config = function()
      require("configs.marks").config()
    end,
  },

  -- themes
  -- give your favorite theme a priority = 1000
  --{ 'sainnhe/gruvbox-material' }
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("configs.themes.gruvbox").config()
    end,
    priority = 1000,
  },
  --{ 'folke/tokyonight.nvim', }

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("configs.nvimcolorizer").config()
    end,
  },
  -- }}}

  {
    "folke/which-key.nvim",
    config = function()
      require("configs.which-key").config()
    end,
  },

  {
    "godlygeek/tabular",
  },

  {
    "preservim/tagbar",
    config = function()
      require("configs.tagbar").config()
    end,
  }
})
-- vim: foldmarker={{{,}}} fdm=marker
