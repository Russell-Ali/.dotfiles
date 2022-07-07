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

"----------"

let mapleader = " "

vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+p
vnoremap <C-p> "+p
noremap  <F7> <cmd>set spell!<cr>
nnoremap <leader><Tab> <cmd>bnext<cr>
nnoremap <leader><S-Tab> <cmd>bprevious<cr>
nnoremap <leader>c <cmd>bd<cr>
nnoremap <leader>C <cmd>bd!<cr>
nnoremap <C-left> <C-w>r
nnoremap <C-right> <C-w>R
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>r <cmd>!./%<cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let g:floaterm_keymap_new = '<A-\>'
let g:floaterm_keymap_prev = '<A-[>'
let g:floaterm_keymap_next = '<A-]>'
let g:floaterm_keymap_first = '<A-{>'
let g:floaterm_keymap_last = '<A-}>'
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

let g:coq_settings = {'auto_start': 'shut-up' , 'display.icons.mode' : 'short' ,
    \ "clients.snippets.warn" : [],
    \ 'display.pum.kind_context' : [" ", ""], 'display.pum.source_context' : [" ", ""],
    \ 'display.icons.mappings' : {
    \ "Boolean": "", "Character": "", "Class": "", "Color": "",
    \ "Constant": "", "Constructor": "", "Enum": "", "EnumMember": "",
    \ "Event": "", "Field": "", "File": "", "Folder": "",
    \ "Function": "", "Interface": "ﰮ", "Keyword": "", "Method": "",
    \ "Module": "", "Number": "", "Operator": "Ψ", "Parameter": "",
    \ "Property": "", "Reference": "", "Snippet": "", "String": "",
    \ "Struct": "", "Text": "", "TypeParameter": "", "Unit": "",
    \ "Value": "", "Variable": "" },
    \ "clients.snippets.short_name" : "SNP"}

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
let g:airline_symbols.branch = '󰘬 '
let g:airline_symbols.readonly = '󰌾 '
let g:airline_symbols.dirty='󱈸'

"----------"

augroup stuff
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
autocmd BufEnter * set fo-=c fo-=r fo-=o
autocmd BufNewFile,BufRead *.md,*.txt set spell | set wrap | nnoremap j gj| nnoremap k gk
augroup end

"----------"

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'folke/zen-mode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'gruvbox-community/gruvbox'
call plug#end()

"----------"

colorscheme gruvbox
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
hi SignColumn guibg=bg ctermbg=bg
highlight GitGutterAdd guibg=bg ctermbg=bg
highlight GitGutterChange guibg=bg ctermbg=bg
highlight GitGutterDelete guibg=bg ctermbg=bg
highlight GitGutterChangeDelete guibg=bg ctermbg=bg
syntax enable

"----------"

lua << EOF

local lsp_installer = require("nvim-lsp-installer")

local lspconfig = require("lspconfig")

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

require'colorizer'.setup()

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
  }
  server:setup(opts)
end)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require'nvim-web-devicons'.setup {
 default = true;
}
require'nvim-web-devicons'.get_icons()

require("nvim-tree").setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = {
            'vim'
        }
    },
    indent = {
        enable = false,
        disable = {},
    },
}

EOF
