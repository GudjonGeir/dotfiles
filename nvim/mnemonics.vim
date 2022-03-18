call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_map_local")

let g:which_key_map_local =  {}

let g:which_key_map =  {}

let g:which_key_map.b = {
       \ 'name' : '+buffer' ,
       \ 'd' : 'delete-buffer',
       \ 'f' : 'first-buffer',
       \ 'l' : 'last-buffer',
       \ 'n' : 'next-buffer',
       \ 'p' : 'previous-buffer',
       \ 'b' : 'fzf-buffer',
       \ 'x' : 'delete-buffer-and-window',
       \ }

let g:which_key_map['c'] = {
      \ 'name' : '+comments' ,
      \ 'l' : 'comment-or-uncomment-lines',
      \ 'p' : 'comment-or-uncomment-paragraph',
      \ }

let g:which_key_map['g'] = {
      \ 'name' : '+git/version-control' ,
      \ 'g' : 'lazygit',
      \ 'b' : 'blame',
      \ 'd' : 'diff',
      \ 'P' : 'preview hunk',
      \ 'p' : 'prev hunk',
      \ 'n' : 'next hunk',
      \ 's' : 'stage hunk',
      \ 'u' : 'undo stage hunk',
      \ 'R' : 'reset hunk',
      \ 't' : {
           \ 'name': '+toggles',
           \ 't' : 'toggle signs',
           \ 'b' : 'toggle line blame',
           \ }
      \ }

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.s = { 'name' : '+split' }

let g:which_key_map.f = { 'name' : '+file' }
let g:which_key_map.f.f = "find files"
let g:which_key_map.f.r = "find recent"
let g:which_key_map.f.t = { 'name' : '+tree' }
let g:which_key_map.f.t.t = 'toggle'
let g:which_key_map.f.t.f = 'find'
let g:which_key_map.f.e = { 'name' : '+environment' }
let g:which_key_map.f.e.e = 'vimrc'
let g:which_key_map.f.e.r = 'reload'
"call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map['/'] = 'live grep'
let g:which_key_map['*'] = 'grep string'
let g:which_key_map['.'] = 'resume search'

" LSP bindings
" TODO: only do when lsp is loaded?
let g:which_key_map_local.g = { 'name' : '+goto' }
let g:which_key_map_local.g.g = { 'name' : '+LspDef' }
let g:which_key_map_local.g.r = { 'name' : '+LspRefs' }

let g:which_key_map_local.h = { 'name' : '+help' }
let g:which_key_map_local.h.d = { 'name' : '+LspTypeDef' }
let g:which_key_map_local.h.h = { 'name' : '+LspHover' }

let g:which_key_map_local.r = { 'name' : '+refactor' }
let g:which_key_map_local.r.r = { 'name' : '+LspRename' }
let g:which_key_map_local.r.o = { 'name' : '+LspOrganize' }

let g:which_key_map_local.d = { 'name' : '+diagnostic' }
let g:which_key_map_local.d.n = { 'name' : '+LspDiagPrev' }
let g:which_key_map_local.d.l = { 'name' : '+LspDiagLine' }
