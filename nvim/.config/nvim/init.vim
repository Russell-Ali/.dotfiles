set number relativenumber
set mouse=a
set guicursor=
set ls=2
set tabstop=4
set shiftwidth=4
set expandtab
set noerrorbells
set hidden
set noswapfile
set nobackup
set undodir=$HOME/.local/share/nvim/undo
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
set spelllang=en_us
set spellsuggest=best,9
set complete+=kspell
set updatetime=400
set termguicolors

let mapleader = " "
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

let g:NERDTreeWinSize=30

let g:floaterm_keymap_new = '<A-\>'
let g:floaterm_keymap_prev = '<A-[>'
let g:floaterm_keymap_next = '<A-]>'
let g:floaterm_keymap_first = '<A-{>'
let g:floaterm_keymap_last = '<A-}>'
let g:floaterm_keymap_toggle = '<A-t>'
let g:floaterm_keymap_kill =  '<A-c>'
let g:floaterm_height = 0.7
tnoremap <Esc> <C-\><C-n>

autocmd BufEnter * set fo-=c fo-=r fo-=o
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter NERD_tree_1 setlocal signcolumn=no
autocmd FileType alpha let airline_section_c = ' '

let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = '${name}'
let g:mkdp_browser = 'surf'

vnoremap <C-y> "+y
vnoremap <C-x> "+x
nnoremap <C-p> "+p
vnoremap <C-p> "+p
noremap  <F7> <cmd>set spell!<cr>
noremap  Q <Nop>
nnoremap <leader><Tab> <cmd>bnext<cr>
nnoremap <leader><S-Tab> <cmd>bprevious<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>c <cmd>bd<cr>
nnoremap <leader>C <cmd>bd!<cr>
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
nnoremap <A-n> <cmd>NERDTreeToggle<cr>

call plug#begin()
Plug 'lewis6991/impatient.nvim'
Plug 'tpope/vim-commentary'
Plug 'folke/zen-mode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'gruvbox-community/gruvbox'
call plug#end()

lua require("impatient")

colorscheme gruvbox
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
hi SignColumn guibg=bg ctermbg=bg
highlight GitGutterAdd guibg=bg ctermbg=bg
highlight GitGutterChange guibg=bg ctermbg=bg
highlight GitGutterDelete guibg=bg ctermbg=bg
highlight GitGutterChangeDelete guibg=bg ctermbg=bg
syntax enable

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

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local date = os.date("%A, %d %B %Y")

dashboard.section.header.val = {
 "  ██████╗ ██████╗  █████╗ ██╗   ██╗ ", 
 " ██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝ ", 
 " ██║  ███╗██████╔╝███████║ ╚████╔╝  ", 
 " ██║   ██║██╔══██╗██╔══██║  ╚██╔╝   ", 
 " ╚██████╔╝██║  ██║██║  ██║   ██║    ", 
 "  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ", 
string.format("     %s      ", date),
}

dashboard.section.buttons.val = {
    dashboard.button( "n", "󰈤 󰨃 New file" , "<cmd>ene <BAR> startinsert <cr>"),
    dashboard.button( "f", "󰮗 󰨃 Find files", "<cmd>Telescope find_files<cr>"),
    dashboard.button( "r", "󱀸 󰨃 Recent files"   , "<cmd>Telescope oldfiles<cr>"),
    dashboard.button( "s", "󰘮 󰨃 Settings" , "<cmd>e $MYVIMRC <cr>"),
    dashboard.button( "q", "󰈆 󰨃 Quit NVIM", "<cmd>qa<CR>"),
}

local handle_plug = io.popen('ls $HOME/.local/share/nvim/plugged/ | wc -l')
local plugs = handle_plug:read("*a")
handle_plug:close()

local handle_version= io.popen("nvim -v | grep 'NVIM' | awk '{print $2}' | tr -d ' \t\n\r' ")
local version = handle_version:read("*a")
handle_version:close()

dashboard.section.footer.val = {
 "                               ",
 string.format("Currently, %d plugins installed", plugs),
 "                               ",
 string.format("             %s             ",version ),
}
alpha.setup(dashboard.opts)

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
