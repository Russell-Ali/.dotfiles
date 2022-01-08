set number relativenumber
set guicursor=
set ls=2
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set hidden
set noswapfile
set nobackup
set undodir=$HOME/.vim/undo
set undofile
set nowrap
set incsearch
set scrolloff=8
set smartindent
set noshowmode
set ignorecase
set smartcase
set filetype=on
syntax on
colorscheme NeoSolarized
set background=dark
let mapleader = " "
let g:airline#extensions#bufferline#enabled = 1
let g:airline_section_z = '%-c | %-p%%'
let g:airline_section_y = ''
vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+P
vnoremap <C-p> "+P
nnoremap <C-Space> :Telescope find_files<cr>

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
