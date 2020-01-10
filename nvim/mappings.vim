nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
vnoremap <leader>k "+y<cr>

" Bind leader space bar as the leader key for vim.
let mapleader = " "

" Bind , as the local leader for specific filetypes.
let maplocalleader = ","

" Bind leader (space) p to start Ctrl+p in normal mode.
"nnoremap <leader><space> 

nnoremap <silent> <leader><space> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader>, :WhichKey ','<CR>

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
nnoremap <leader>pb :call fzf#vim#buffers()<CR>

nnoremap <leader>tr :set relative!<cr>
nnoremap <leader>tn :set number!<cr>

nnoremap <leader>sn :noh<cr>
