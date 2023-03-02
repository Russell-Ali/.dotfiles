vim.cmd [[ packadd packer.nvim]]

-- Plugins

return require('packer').startup({
  function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- kanagawa color scheme
    use {
      "rebelot/kanagawa.nvim",
      require('kanagawa').setup()
    }

    -- toggle term
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        direction = 'vertical',
        start_in_insert = false,
        -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
        size = function(term)
          if term.direction == "horizontal" then
            return 10
          elseif term.direction == "vertical" then
            return math.ceil(vim.o.columns * 0.275)
          end
        end,
        autochdir = true,
      }
    end }

    -- neovim colorizer
    use {
      "norcalli/nvim-colorizer.lua",
      require 'colorizer'.setup()
    }


    -- impatient nvim
    use 'lewis6991/impatient.nvim'

    -- lspconfig
    use "neovim/nvim-lspconfig"

    -- lspinstaller
    use "williamboman/nvim-lsp-installer"

    -- tree sitter
    use 'nvim-treesitter/nvim-treesitter'

    -- vim commentary
    use 'tpope/vim-commentary'

    -- zenmode
    use "folke/zen-mode.nvim"

    -- lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- mardown preview
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
        vim.g.mkdp_echo_preview_url = 1
      end,
      ft = { "markdown" },
    })

    -- web-dev icons
    use 'kyazdani42/nvim-web-devicons'

    -- git signs
    use {
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
    }

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use({
      "L3MON4D3/LuaSnip",
      tag = "v<CurrentMajor>.*",
      require("luasnip.loaders.from_vscode").lazy_load()
    })
    use 'saadparwaiz1/cmp_luasnip'

    -- nvim tree
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    }
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
