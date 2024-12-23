" Plug

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

call plug#end()

" Config

let mapleader = " "

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <leader>a :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :GFiles<CR>

set number
set relativenumber
