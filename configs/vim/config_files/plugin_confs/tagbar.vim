nnoremap <F3> :TagbarToggle<CR>
augroup yaml_ft
  au!
  autocmd BufNewFile,BufRead *.yaml let g:tagbar_width = 70
augroup END

let g:tagbar_width = 40
let g:tagbar_type_yaml = {
            \ 'ctagstype' : 'yaml',
            \ 'kinds'     : [
                \ 'p:property:1:0',
                \ 'e:endpoint:1:0',
                \ 'd:definition:1:0',
            \ ],
            \ }

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
          \ 'f:functions',
          \ 'c:constants',
      \ ]}
