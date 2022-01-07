set number relativenumber
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
set background=dark
colorscheme solarized
let mapleader = " "
let $FZF_DEFAULT_COMMAND='find .'
vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+P
vnoremap <C-p> "+P
nnoremap <C-@> :Files %:p:h<cr>

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
