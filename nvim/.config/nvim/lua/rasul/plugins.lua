-- Bootstrap Lazy Nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Bootstrap Lazy Nvim

local plugins = {
  -- Formatter
  {
    'stevearc/conform.nvim',
  },
  -- Lorem Ipsum
  {
    'derektata/lorem.nvim'
  },
  -- Codeium
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },

  -- Lua Line
  'nvim-lualine/lualine.nvim',

  -- Noice Nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },
  --
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- Colorscheme plugin
  'projekt0n/github-nvim-theme',

  -- Dressing Nvim
  'stevearc/dressing.nvim',

  -- Tmux Navigation
  'christoomey/vim-tmux-navigator',

  -- Plenary
  'nvim-lua/plenary.nvim',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
  },
  -- Comment Nvim
  'numToStr/Comment.nvim',

  -- Web Dev Icons
  {
    'nvim-tree/nvim-web-devicons',
    dependencies = { 'windwp/nvim-ts-autotag' }
  },

  -- Nvim Tree File Explorer
  'nvim-tree/nvim-tree.lua',

  -- Oil Nvim
  'stevearc/oil.nvim',

  -- Mason
  {
    'williamboman/mason.nvim',
    -- custom deps just for convenience
    dependencies = { 'williamboman/mason-lspconfig.nvim' }
  },

  -- LSP Config
  'neovim/nvim-lspconfig',

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
  },

  -- Git Fugitive
  'tpope/vim-fugitive',

  -- Git Signs
  'lewis6991/gitsigns.nvim',

  -- cmp
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
}

-- Options
local opts = {
  install = {
    missing = true,
  },
}

-- Activate the plugins
require('lazy').setup(plugins, opts)
