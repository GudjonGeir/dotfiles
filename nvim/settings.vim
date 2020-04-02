syntax on

let g:edge_style = 'aura'
set termguicolors
set background=dark
colorscheme edge

set history=10000
set hidden
set notimeout
set number
set numberwidth=4
" set relativenumber
set wrap
set autoindent
set lcs=trail:·,tab:»·
set nolist
set autoread
set backspace=eol,start,indent
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set lazyredraw
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set showmatch
set scrolloff=5
set hlsearch
set ignorecase
set smartcase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*/node_modules/*
set wildmenu
"set shiftround
"set smarttab

"" Configure NERDTree
let NERDTreeIgnore = ['\.pyc$']
" NERDTree configuration
" Disable nerdtree for opeing up in new sessions.
let g:NERDTreeHijackNetrw=0

"" Configure Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='edge'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline_theme='ayu'


"" Configure ctrlp
let g:ctrlp_max_files=0

" Material theme colors
set termguicolors
let g:terminal_color_0 = "#2c2c2c"
let g:terminal_color_1 = "#c62727"
let g:terminal_color_2 = "#558b2e"
let g:terminal_color_3 = "#f9a824"
let g:terminal_color_4 = "#1564bf"
let g:terminal_color_5 = "#691e99"
let g:terminal_color_6 = "#00828e"
let g:terminal_color_7 = "#f2f2f2"

let g:terminal_color_8 = "#535353"
let g:terminal_color_9 = "#ef524f"
let g:terminal_color_10 = "#8bc249"
let g:terminal_color_11 = "#ffea3a"
let g:terminal_color_12 = "#64b5f6"
let g:terminal_color_13 = "#ba67c8" 
let g:terminal_color_14 = "#26c6da"
let g:terminal_color_15 = "#e0e0e0"
