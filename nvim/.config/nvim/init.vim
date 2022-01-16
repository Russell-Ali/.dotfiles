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
set nohlsearch
set noshowmode
set signcolumn=yes
set ignorecase
set smartcase
set filetype=on
set background=dark

syntax on
colorscheme NeoSolarized

let mapleader = " "
let g:airline#extensions#bufferline#enabled = 1
let g:airline_section_z = '%-c | %-p%%'
let g:airline_section_y = ''

vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+P
vnoremap <C-p> "+P
nnoremap <Leader><Tab> <cmd>bnext<cr>
nnoremap <Leader><S-Tab> <cmd>bprevious<cr>
nnoremap <Leader>c <cmd>bd<cr>
nnoremap <Leader><S-w> <cmd>bd!<cr>
nnoremap <C-Space> <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <leader>gr <cmd>lua vim.lsp.buf.references()<cr>

call plug#begin()
Plug 'bling/vim-bufferline'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

lua << EOF
local lsp_installer = require("nvim-lsp-installer")

local function on_attach(client, bufnr)
end

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
EOF
