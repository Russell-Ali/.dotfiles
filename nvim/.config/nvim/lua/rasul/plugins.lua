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
  -- Copilot Nvim
  'zbirenbaum/copilot.lua',

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

  -- Colorscheme plugin
  'projekt0n/github-nvim-theme',

  -- Dressing Nvim
  'stevearc/dressing.nvim',

  -- Tmux Navigation
  'christoomey/vim-tmux-navigator',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Comment Nvim
  'numToStr/Comment.nvim',

  -- Web Dev Icons
  'nvim-tree/nvim-web-devicons',

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
    dependencies = {
      'windwp/nvim-ts-autotag'
    }
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

  -- snippets for cmp
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },
  { 'saadparwaiz1/cmp_luasnip' },

}

-- Options
local opts = {
  install = {
    missing = true,
  },
}

-- Activate the plugins
require('lazy').setup(plugins, opts)
