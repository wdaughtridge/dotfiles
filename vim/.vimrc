" Plug

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

call plug#end()

" Config

let mapleader = " "

nnoremap <leader>a :Files<CR>
nnoremap <leader>f :GFiles<CR>

set number
set relativenumber
