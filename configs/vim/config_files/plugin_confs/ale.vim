let g:ale_linters = {
            \   'typescript': ['tslint', 'tsserver', 'eslint'],
            \   'javascript': ['eslint', 'prettier'],
            \   'python': ['pyls'],
            \   'cpp': ['ccls']
            \}

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1

let g:ale_python_pyls_executable = fnamemodify(g:python3_host_prog, ":p:h") . "/pyls"

let g:ale_python_pyls_config = {
      \   'pyls': {
      \     'plugins': {
      \       'flake8': {
      \         'enabled': v:true,
      \       },
      \       'pycodestyle': {
      \         'enabled': v:true,
      \         'maxLineLength': 88,
      \         'ignore': ["E203",]
      \       },
      \     }
      \   },
      \ }
