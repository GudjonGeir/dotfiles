call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'flrnd/plastic.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'voldikss/vim-floaterm'

Plug 'reasonml-editor/vim-reason'
" Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'commit': '0394fbaa2def5a5e304f7f4c08def4de4cb9e689',
"     \ 'do': 'bash install.sh',
"     \ }


call plug#end()

" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['/Users/ggj/.apps/reason-language-server/reason-language-server']
"     \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1
" close preview window after autocomplete is finished
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
" enable language client
" let g:LanguageClient_autoStart = 1

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_reason_enabled_makers = ['merlin']
let g:neomake_open_list = 2
"     let g:neomake_error_sign = {
"         \ 'text': '✖',
"         \ 'texthl': 'ErrorMsg',
"         \ }
"     let g:neomake_warning_sign = {
"         \   'text': '‼',
"         \   'texthl': 'WarningMsg',
"         \ }
"     let g:neomake_message_sign = {
"          \   'text': '➤',
"          \   'texthl': 'MoreMsg',
"          \ }
"     let g:neomake_info_sign = {
"          \ 'text': 'ℹ',
"          \ 'texthl': 'Normal'
"          \ }


if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.ocaml = '[^. *\t]\.\w*|\s\w*|#'



inoremap <C-U> <C-G>u<C-U>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line




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

