" Managed by Ansible
" Created by wdaughtridge@gmail.com

" Plug

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'ayu-theme/ayu-vim'

call plug#end()

" Config

set termguicolors
let ayucolor="dark"
colorscheme ayu

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = " "

nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>

syntax on
filetype on

set expandtab
set bs=2
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smartcase
set ignorecase
set modeline
set nocompatible
set encoding=utf-8
set hlsearch
set history=700
set t_Co=256
set background=dark
set tabpagemax=1000
set ruler
set nojoinspaces
set shiftround
set relativenumber
set number
set nolbr
set tw=0

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map Q <Nop>

filetype plugin on

map <C-F12> :!ctags -R -I --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" vim: filetype=vim

