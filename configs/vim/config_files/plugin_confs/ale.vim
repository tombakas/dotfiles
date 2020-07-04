let g:ale_linters = {
            \   'typescript': ['tslint', 'tsserver', 'eslint'],
            \   'javascript': ['eslint', 'prettier'],
            \   'python': ['pyls'],
            \   'cpp': ['ccls']
            \}

let g:ale_python_pyflakes_executable = $HOME . "/local/neovim_envs/neovim3/bin/pyflakes"
let g:ale_python_pylint_executable = $HOME . "/local/neovim_envs/neovim3/bin/pylint"

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = "-m flake8 --ignore=E501"

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1

let g:ale_python_pyls_executable = fnamemodify(g:python3_host_prog, ":p:h") . "/pyls"

let g:ale_python_pyls_config = {
      \   'pyls': {
      \     'plugins': {
      \       'flake8': {
      \         'enabled': v:true
      \       },
      \       'yapf': {
      \         'enabled': v:true
      \       },
      \       'pycodestyle': {
      \         'enabled': v:true,
      \         'ignore': "E501"
      \       },
      \     }
      \   },
      \ }
