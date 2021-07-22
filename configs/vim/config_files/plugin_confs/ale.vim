let g:ale_linters = {
            \   'typescript': ['tslint', 'tsserver', 'eslint'],
            \   'javascript': ['eslint', 'prettier'],
            \   'python': ['pylsp'],
            \   'cpp': ['ccls']
            \}

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1

let g:ale_python_pylsp_executable = fnamemodify(g:python3_host_prog, ":p:h") . "/pylsp"

let g:ale_python_pylsp_config = {
      \   'pylsp': {
      \     'plugins': {
      \       'flake8': {
      \         'enabled': v:true,
      \       },
      \       'pycodestyle': {
      \         'enabled': v:true,
      \         'maxLineLength': 120,
      \         'ignore': ["E203",]
      \       },
      \     }
      \   },
      \ }
