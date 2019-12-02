autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType json,yaml,vue setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css,scss,less,typescript,cpp,hpp setlocal shiftwidth=2 tabstop=2

" Indentation for yaml
au BufRead *.yml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" All html is djangohtml
au BufNewFile,BufRead *.html set filetype=htmldjango

" Fountain
au BufRead,BufNewFile *.fountain setfiletype fountain

" Python
au FileType python set foldmethod=expr
