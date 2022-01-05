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
set ignorecase
set smartcase
set filetype=on
syntax on
set background=dark
colorscheme solarized
vnoremap <C-y> "+y
vnoremap <C-x> "+x
map <C-p> "+P

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
