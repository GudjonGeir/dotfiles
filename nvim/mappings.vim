vnoremap <leader>k "+y<cr>

" Bind leader space bar as the leader key for vim.
let mapleader = " "

" Bind , as the local leader for specific filetypes.
let maplocalleader = ","

" Bind leader (space) p to start Ctrl+p in normal mode.
"nnoremap <leader><space>

" nnoremap <silent> <leader><space> :WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader>, :WhichKey ','<CR>

nnoremap <leader>bd :BD<cr>
nnoremap <leader>bf :bfirst<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bb :Telescope buffers<cr>
nnoremap <leader>bx :bd<cr>

" TODO: convert to lua, use gitsigns onAttach
nnoremap <leader>gb :Git blame<cr>
" nnoremap <leader>gc :BCommits<cr>
" nnoremap <leader>gC :Gcommit<cr>
nnoremap <leader>gd :Gitsigns diffthis<cr>
" nnoremap <leader>ge :Gedit<cr>
" nnoremap <leader>gl :Glog<cr>
" noremap <leader>gm :exec ":Gmove! ".input("New location: ")<cr>
" nnoremap <leader>gr :Gread<cr>
" nnoremap <leader>gs :Gstatus<cr>
" nnoremap <leader>gw :Gwrite<cr>
" nnoremap <leader>gp :Gpull<cr>
" nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gg :call Lazygit()<cr>
nnoremap <leader>gtt :Gitsigns toggle_signs<cr>
nnoremap <leader>gtb :Gitsigns toggle_current_line_blame<cr>
nnoremap <leader>gP :Gitsigns preview_hunk<cr>
nnoremap <leader>gp :Gitsigns prev_hunk<cr>
nnoremap <leader>gn :Gitsigns next_hunk<cr>
nnoremap <leader>gs :Gitsigns stage_hunk<cr>
vnoremap <leader>gs :Gitsigns stage_hunk<cr>
nnoremap <leader>gu :Gitsigns undo_stage_hunk<cr>
nnoremap <leader>gR :Gitsigns reset_hunk<cr>
vnoremap <leader>gR :Gitsigns reset_hunk<cr>

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

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fr :Telescope oldfiles<cr>
nnoremap <leader>fee :vsplit $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fes :source $MYVIMRC<cr>
nnoremap <leader>ftt :NvimTreeToggle<cr>
nnoremap <leader>ftf :NvimTreeFindFile<cr>

nnoremap <leader>/ :Telescope live_grep<cr>
nnoremap <leader>* :Telescope grep_string<cr>
nnoremap <leader>. :Telescope resume<cr>

nnoremap <leader>tr :set relativenumber!<cr>
nnoremap <leader>tn :set number!<cr>
