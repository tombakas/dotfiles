command! FZFLines call fzf#run({
            \   'source':  <sid>buffer_lines(),
            \   'sink':    function('<sid>line_handler'),
            \   'options': '--extended --nth=3..',
            \   'down':    '60%'
            \})

nnoremap <leader>f :FZFLines<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>a :Ag 
nmap <leader>t :FZF<CR>
nmap <leader>be :Buffers<CR>
nmap <Up> :History<CR>
nmap <leader>g :GFiles?<CR>

" FZF buffer search function
function! s:line_handler(l)
    let keys = split(a:l, ':\t')
    exec 'buf' keys[0]
    exec keys[1]
    normal! ^zz
endfunction

function! s:buffer_lines()
    let res = []
    for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
        call extend(res, map(getbufline(b,0,"$"), 'bufname(b) . ":\t" . (v:key + 1) . ":\t" . v:val '))
    endfor
    return res
endfunction
