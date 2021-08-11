vnoremap <leader>k "+y<cr>

" Bind leader space bar as the leader key for vim.
let mapleader = " "

" Bind , as the local leader for specific filetypes.
let maplocalleader = ","

" Bind leader (space) p to start Ctrl+p in normal mode.
"nnoremap <leader><space>

nnoremap <silent> <leader><space> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>, :WhichKey ','<CR>

nnoremap <leader>bd :BD<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bb :call fzf#vim#buffers()<CR>
nnoremap <leader>bx :bd<cr>

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :BCommits<cr>
nnoremap <leader>gC :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gm :exec ":Gmove! ".input("New location: ")<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gp :Gpull<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gg :call Lazygit()<cr>
nnoremap <leader>gt :GitGutterToggle<cr>
nnoremap <leader>ghp :GitGutterPrevHunk<cr>
nnoremap <leader>ghn :GitGutterNextHunk<cr>

nmap <leader>cl <Plug>CommentaryLine
vmap <leader>cl <Plug>Commentary
nmap <leader>cp gcip<cr>

nnoremap <leader>wsh :sp<cr>
nnoremap <leader>wsv :vsp<cr>
nnoremap <leader>wc <C-w>c<cr>
nnoremap <leader>wo <C-w>o<cr>
nnoremap <leader>wmu <C-w>K<cr>
nnoremap <leader>wmd <C-w>J<cr>
nnoremap <leader>wml <C-w>H<cr>
nnoremap <leader>wmr <C-w>L<cr>

nnoremap <leader>fee :vsplit $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fes :source $MYVIMRC<cr>
nnoremap <leader>ftt :NERDTreeToggle<cr>
nnoremap <leader>ftf :NERDTreeFind<cr>

" nnoremap <leader>pf :CtrlP<CR>
" nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pf :call fzf#vim#gitfiles('--cached --exclude-standard --others', fzf#vim#with_preview('right'))<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
nnoremap <leader>/ :Rg<cr>
nnoremap <leader>* :Rg <c-r>=expand("<cword>")<cr><cr>
" nnoremap <leader>/ :call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<c-r>=expand("<cword>")<cr>), 1, fzf#vim#with_preview(), <bang>0)<cr>


nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>

nnoremap <leader>sn :noh<cr>
