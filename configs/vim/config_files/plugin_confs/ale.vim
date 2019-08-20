let g:ale_linters = {
            \   'typescript': ['tslint', 'tsserver', 'eslint'],
            \   'python': ['flake8']
            \}

let g:ale_python_pyflakes_executable = $HOME . "/local/neovim_envs/neovim3/bin/pyflakes"
let g:ale_python_pylint_executable = $HOME . "/local/neovim_envs/neovim3/bin/pylint"

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = "-m flake8 --ignore=E501"

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 1

function! Toggle_flake8_python_executable()
    if g:ale_python_flake8_executable == g:python3_host_prog
        echom "Setting flake 8 executable to python"
        let g:ale_python_flake8_executable = g:python_host_prog
    elseif g:ale_python_flake8_executable == g:python_host_prog
        echom "Setting flake 8 executable to python3"
        let g:ale_python_flake8_executable = g:python3_host_prog
    endif
    ALELint
endfunction
