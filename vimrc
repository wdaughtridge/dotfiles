" Config

set termguicolors
colorscheme sorbet

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = " "

map Q <Nop>

syntax on
filetype on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview

set bs=2
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
set nolbr
set tw=0
set signcolumn=yes

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

hi Normal guibg=NONE ctermbg=NONE
