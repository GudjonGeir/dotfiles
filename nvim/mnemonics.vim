call which_key#register('<Space>', "g:which_key_map")
call which_key#register(',', "g:which_key_map_local")

let g:which_key_map_local =  {}

let g:which_key_map =  {}

let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.s = { 'name' : '+split' }

let g:which_key_map.f = { 'name' : '+file' }
let g:which_key_map.f.t = { 'name' : '+tree' }
let g:which_key_map.f.t.t = 'toggle'
let g:which_key_map.f.t.f = 'find'
let g:which_key_map.f.e = { 'name' : '+environment' }
let g:which_key_map.f.e.e = 'vimrc'
let g:which_key_map.f.e.r = 'reload'
let g:which_key_map.p = { 'name' : '+ctrlp' }
let g:which_key_map.p.b = "buffers" 
let g:which_key_map.p.f = "files" 
"call which_key#register('<Space>', "g:which_key_map")

" Configuration ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git$\'

