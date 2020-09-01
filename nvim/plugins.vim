call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vim-which-key'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'flrnd/plastic.vim'
Plug 'gryf/wombat256grf'
Plug 'sainnhe/edge'
" Plug 'reasonml-editor/vim-reason'
" Plug 'neomake/neomake'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'reasonml-editor/vim-reason-plus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'commit': '0394fbaa2def5a5e304f7f4c08def4de4cb9e689',
"     \ 'do': 'bash install.sh',
"     \ }


call plug#end()

" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['/Users/ggj/.apps/reason-language-server/reason-language-server']
"     \ }

" enable autocomplete
" let g:deoplete#enable_at_startup = 1
" close preview window after autocomplete is finished
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
" enable language client
" let g:LanguageClient_autoStart = 1

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)
" let g:neomake_reason_enabled_makers = ['merlin']
" let g:neomake_open_list = 2


" if !exists('g:deoplete#omni_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.ocaml = '[^. *\t]\.\w*|\s\w*|#'



" inoremap <C-U> <C-G>u<C-U>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

set updatetime=100
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0


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
