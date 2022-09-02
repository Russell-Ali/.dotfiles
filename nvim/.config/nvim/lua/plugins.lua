-- Variables

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Bootstrapping packer
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

-- Plugins
return require('packer').startup({ function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- neovim colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        require 'colorizer'.setup()
    }

    -- lightspeed motions
    use {
        'ggandor/lightspeed.nvim',
        requires = 'tpope/vim-repeat'
    }

    -- impatient nvim
    use 'lewis6991/impatient.nvim'

    -- lspconfig
    use "neovim/nvim-lspconfig"

    -- lspinstaller
    use {
        "williamboman/nvim-lsp-installer",
        require("nvim-lsp-installer").setup {
            automatic_installation = true,
        }
    }

    -- tree sitter
    use 'nvim-treesitter/nvim-treesitter'

    -- floaterm
    use "akinsho/toggleterm.nvim"

    -- vim commentary
    use 'tpope/vim-commentary'

    -- zenmode
    use "folke/zen-mode.nvim"

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- mardown preview
    use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_echo_preview_url = 1
        end,
        ft = { "markdown" },
    })

    -- web-dev icons
    use {
        'kyazdani42/nvim-web-devicons',
        require 'nvim-web-devicons'.setup {
            default = true;
        }
    }

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
        require('gitsigns').setup {
            numhl              = true,
            current_line_blame = true,
            watch_gitdir       = {
                interval = 100,
            },
        }
    }

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use {
        'L3MON4D3/LuaSnip',
        require("luasnip.loaders.from_snipmate").lazy_load()
    }
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
    } })
