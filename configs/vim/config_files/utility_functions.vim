" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <leader><leader>z :ZoomToggle<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Filter contents through jq
nmap <leader>jq :%!jq "."<CR>

" Toggle dark/light mode
function! g:LighDarkToggle()
    if exists('g:light') && g:light
        colo OceanicNext
        AirlineTheme onedark
        let g:light = 0
        let $FZF_DEFAULT_OPTS = '--color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168'
    else
        colo OceanicNextLight
        AirlineTheme oceanicnextlight
        let g:light = 1
        let $FZF_DEFAULT_OPTS = '--color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33 --color info:33,prompt:33,pointer:166,marker:166,spinner:33'
    endif
endfunction

command! LighDarkToggle call g:LighDarkToggle()
nnoremap <leader>ld :LighDarkToggle<CR>

function! OpenTerminal()
    " start terminal in insert mode
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif

    set splitright
    set splitbelow

    split term://bash
    resize 10
endfunction
