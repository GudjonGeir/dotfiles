augroup GoLang 
  autocmd FileType go nnoremap <localleader>bb :GoBuild<CR>
  autocmd FileType go nnoremap <localleader>br :GoRun<CR>
  autocmd FileType go nnoremap <localleader>tt :GoTest<CR>
  autocmd FileType go nnoremap <localleader>tf :GoTestFunc<CR>
  autocmd FileType go nnoremap <localleader>ht :GoInfo<CR>
  autocmd FileType go nnoremap <localleader>gg :GoDef<CR>
  autocmd FileType go nnoremap <localleader>gb :GoDefPop<CR>
  autocmd FileType go nnoremap <localleader>gr :GoReferrers<CR>
augroup END
