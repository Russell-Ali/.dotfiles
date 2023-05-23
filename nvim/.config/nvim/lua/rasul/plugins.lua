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

-- List of plugins
local plugins = {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Colorizer [#ff0]
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup({'*';}, { names = false })
    end
  },
  lazy = true,
  -- LspConfig
  {
    'neovim/nvim-lspconfig',
  },
  -- Mason
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
    build = ':MasonUpdate'
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        automatic_installation = true,
      }
    end
  },
  -- DAB
  {
    'mfussenegger/nvim-dap'
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  -- Web Dev Icons
  {
    'nvim-tree/nvim-web-devicons'
  },
  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
  },
  -- Tmux Navigation
  {
    'christoomey/vim-tmux-navigator'
  },
  -- Git Signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        numhl              = true,
        current_line_blame = true,
        watch_gitdir       = {
          interval = 100,
        },
      }
    end
  },
  -- Nvim Tree
  {
    'nvim-tree/nvim-tree.lua'
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter'
  },
  -- CMP
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'dcampos/nvim-snippy' },
  { 'dcampos/cmp-snippy' },
}

-- Options
local opts = {
  install = {
    missing = true,
    colorscheme = {},
  },
}

-- Activate the plugins
require('lazy').setup(plugins, opts)
