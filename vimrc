" Managed by Ansible
" Created by wdaughtridge@gmail.com

" Plug

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'

call plug#end()

" Config

set termguicolors
colorscheme slate

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = " "

nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" vim: filetype=vim
