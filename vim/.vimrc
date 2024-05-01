function! NetrwMapping()
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

let mapleader = " "

colorscheme retrobox 

syntax enable
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set foldcolumn=2
set nu
set rnu
set ruler
set backspace=eol,start,indent
set nowrap
set ignorecase
set smartcase
set nohlsearch
set incsearch
set magic
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set scrolloff=8
set background=dark

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4

set ai 
set si

map <C-u> <C-u>zz
map <C-d> <C-d>zz

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

nmap <leader>w :w!<cr>
map <leader><leader> <C-w>w
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tl :tabnext<cr>
map <leader>th :tabprev<cr>
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
map <leader>o :ls<cr>:buffer 
map <leader>ls :ls<cr>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map 0 ^

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

map <leader>q :wq<CR>

let g:netrw_banner = 0

" insert mode
inoremap <expr> <C-j> '<ESC>'.winheight(0)/4.'<C-D>azz'
inoremap <expr> <C-k> '<ESC>'.winheight(0)/4.'<C-U>azz'
inoremap <C-f> <ESC>gT
inoremap <C-g> <ESC>gt

" visual mode
vnoremap <expr> <C-j> winheight(0)/4.'<C-D>zz'
vnoremap <expr> <C-k> winheight(0)/4.'<C-U>zz'
vnoremap <C-f> <ESC>gT
vnoremap <C-g> <ESC>gt

" normal mode
nnoremap <expr> <C-j> winheight(0)/4.'<C-D>zz'
nnoremap <expr> <C-k> winheight(0)/4.'<C-U>zz'
nnoremap <C-f> gT
nnoremap <C-g> gt

hi Normal guibg=NONE ctermbg=NONE
highlight clear FoldColumn
