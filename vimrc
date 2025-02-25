" Managed by Ansible
" Created by wdaughtridge@gmail.com

" Plug

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'

Plug 'dense-analysis/ale'

call plug#end()

" Config

set termguicolors
colorscheme unokai

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

let mapleader = " "

nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>

nnoremap <silent> K <Plug>(ale_hover)
nnoremap <silent> gr <Plug>(ale_find_references)
nnoremap <silent> gd <Plug>(ale_go_to_definition)
nnoremap <silent> gD <Plug>(ale_go_to_implementation)

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map Q <Nop>

syntax on
filetype on
filetype plugin on
set omnifunc=ale#completion#OmniFunc
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

" vim: filetype=vim
