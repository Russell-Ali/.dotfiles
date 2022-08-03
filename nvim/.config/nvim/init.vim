set number relativenumber
set mouse=a
set guicursor=
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set noswapfile
set undodir=$HOME/.local/share/nvim/undo
set undofile
set nowrap
set scrolloff=8
set smartindent
set nohlsearch
set noshowmode
set signcolumn=yes
set laststatus=3
set ignorecase
set smartcase
set filetype=on
set background=dark
set spelllang=en_us
set spellsuggest=best,9
set complete+=kspell
set updatetime=400
set termguicolors
set completeopt=menu,menuone,noselect
set cursorline
set splitright
set splitbelow

"----------"

let mapleader = " "

vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+p
vnoremap <C-p> "+p
noremap  <F7> <cmd>set spell!<cr>
nnoremap <silent> <expr> <F9> ':set bg='.(&bg=='dark' ? "light" : "dark")."<cr>"
nnoremap <leader><Tab> <cmd>bnext<cr>
nnoremap <leader><S-Tab> <cmd>bprevious<cr>
nnoremap <leader>c <cmd>bd<cr>
nnoremap <leader>C <cmd>bd!<cr>
nnoremap <C-left> <C-w>r
nnoremap <C-right> <C-w>R
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>r <cmd>!./%<cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap <leader>s <cmd>set wrap!<cr>

let g:floaterm_keymap_new = '<A-\>'
let g:floaterm_keymap_prev = '<A-[>'
let g:floaterm_keymap_next = '<A-]>'
let g:floaterm_keymap_toggle = '<A-t>'
let g:floaterm_keymap_kill =  '<A-c>'
let g:floaterm_height = 0.7
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>zz <cmd>ZenMode<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gf <cmd>Telescope diagnostics<cr>
nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <leader>F <cmd>lua vim.lsp.buf.formatting()<cr>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<cr>

nnoremap <A-n> <cmd>NvimTreeToggle<cr>

"----------"

let g:airline_section_z = '%-c | %-p%%'
let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'c' ],
            \ [ 'x', 'z', 'error', 'warning' ]]
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ' '
let g:airline_symbols.readonly = ' '
let g:airline_symbols.dirty=''
let g:airline_theme='minimalist'

let g:mkdp_echo_preview_url = 1

"----------"

augroup stuff
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
autocmd BufEnter * set fo-=c fo-=r fo-=o
autocmd BufNewFile,BufRead *.md,*.txt set spell | set wrap | nnoremap j gj| nnoremap k gk
augroup end

"----------"

call plug#begin()
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'folke/zen-mode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Auto Complation
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
call plug#end()

"----------"

colorscheme PaperColor
syntax enable

"----------"

lua << EOF

local lspconfig = require("lspconfig")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.tsserver.setup{
    capabilities = capabilities
}
require'lspconfig'.pyright.setup{
    capabilities = capabilities
}

require'lspconfig'.html.setup {
  capabilities = capabilities
}

require'lspconfig'.cssls.setup {
  capabilities = capabilities
}

require'lspconfig'.bashls.setup{}

require'lspconfig'.svelte.setup{}

require'lspconfig'.tailwindcss.setup{}

require'lspconfig'.eslint.setup{
filetypes =
    { "javascript", "javascriptreact", "javascript.jsx", "vue" },
}

require'lspconfig'.jsonls.setup{}

require'lspconfig'.tsserver.setup{
filetypes =
    { "typescript", "typescriptreact", "typescript.tsx" },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

local cmp = require'cmp'

cmp.setup({
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    }),
sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer',
      options = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
      },
      { name = 'luasnip' },
    }, {
    })
})

require("zen-mode").setup {
  window = {
    backdrop = 1,
    height = 1,
    width = 80,
    options = {
      signcolumn = "no",
      statusline = "laststatus=0",
      number = false,
      relativenumber = false,
    },
  plugins = {
    options = {
      enabled = true,
    },
    twilight = { enabled = false },
  },
  },
}

require('telescope').setup {}
require('telescope').load_extension('fzf')

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require'nvim-web-devicons'.setup {
 default = true;
}

require'nvim-web-devicons'.get_icons()

require("nvim-tree").setup {
      git = {
        ignore = false,
      },
}

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = {
            'vim'
        }
    },
    indent = {
        enable = true,
        disable = {},
    },
}

EOF
