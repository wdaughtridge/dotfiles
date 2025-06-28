" Config
" @location $HOME/.vimrc

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set termguicolors
colorscheme sorbet

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = ' '

map Q <Nop>

nnoremap <leader>f <cmd>Files<CR> 

" Helixisms
nnoremap gh g0
vnoremap gh g0
nnoremap ge G
vnoremap ge G
nnoremap gl g$
vnoremap gl g$
nnoremap ; <Esc>
vnoremap ; <Esc>

syntax on
filetype plugin on

set ttimeout
set ttimeoutlen=100

set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

set mouse=a

set backspace=2
set shiftround
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set encoding=utf-8
set hlsearch
set history=700
set t_Co=256
set background=dark
set ruler
set relativenumber
set number
set nolinebreak
set tw=0
set signcolumn=yes

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

hi Normal guibg=NONE ctermbg=NONE
