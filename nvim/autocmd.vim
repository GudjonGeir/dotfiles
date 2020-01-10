"autocmd Filetype javascript setlocal ts=2 sw=2 expandtab sts=2
"autocmd Filetype python setlocal ts=4 sw=4 expandtab sts=4
"autocmd Filetype markdown setlocal ts=2 sw=2 noexpandtab sts=2 ai tw=80
"autocmd Filetype tex setlocal ts=2 sw=2 noexpandtab sts=2 ai tw=80
"
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)


augroup Reason
"  autocmd FileType reason nnoremap <localleader>gg :call LanguageClient#textDocument_definition()<cr>
"  autocmd FileType reason nnoremap <localleader>== :call LanguageClient#textDocument_formatting()<cr>
"  autocmd FileType reason nnoremap <localleader>ht :call LanguageClient#textDocument_hover()<cr>
"  autocmd FileType reason nnoremap <localleader>rr :call LanguageClient_textDocument_rename()<cr>

  autocmd FileType reason nnoremap <localleader>gg :MerlinLocate<cr>
  autocmd FileType reason nnoremap <localleader>== :ReasonPrettyPrint<Cr>
  " autocmd bufwritepost *.re silent !standard % --format
  autocmd FileType reason autocmd BufWritePre <buffer> :ReasonPrettyPrint
augroup END
