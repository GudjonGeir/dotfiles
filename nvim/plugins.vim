call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-commentary'
" Plug 'liuchengxu/vim-which-key'
Plug 'folke/which-key.nvim'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'voldikss/vim-floaterm'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'flrnd/plastic.vim'
Plug 'gryf/wombat256grf'
Plug 'sainnhe/edge'


" Languages
Plug 'hashivim/vim-terraform'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-compe'

call plug#end()


" Airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='nord'

" GitGutter 
set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" BufKil
let g:BufKillCreateMappings = 0


" FZF {{{
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.4) " 40% of screen
  let width = float2nr(&columns * 0.7) " 70% of screen
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr(&lines * 0.1) " space to top: 10%

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'anchor': 'NW',
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}

" Handles closing in cases where you would be the last window
function! CloseWindowOnSuccess(code) abort
  if a:code == 0
    let current_window = winnr()
    bdelete!
    " Handles special case where window remains due startify
    if winnr() == current_window
      close
    endif
  endif
endfunction

function! Lazygit()
  " Size variables
  let height = float2nr(&lines * 0.7) " 40% of screen
  let width = float2nr(&columns * 0.9) " 70% of screen
  let vertical = float2nr(&lines * 0.1) " space to top: 10%
  let horizontal = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'anchor': 'NW',
        \ 'style': 'minimal'
        \ }

    let border_opts = {
        \ 'relative': 'editor',
        \ 'row': vertical - 1,
        \ 'col': horizontal - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }

  " Border variables
  let top = "╭" . repeat("─", width + 2) . "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]

  " Buffers
  let buf = nvim_create_buf(v:false, v:true)
  let border_buffer = nvim_create_buf(v:false, v:true)

  call nvim_buf_set_lines(border_buffer, 0, -1, v:true, lines)

  call nvim_open_win(border_buffer, v:true, border_opts)
  call nvim_open_win(buf, v:true, opts)
  call termopen('lazygit', {'on_exit': {_,c -> CloseWindowOnSuccess(c)}})
  startinsert
endfunction
