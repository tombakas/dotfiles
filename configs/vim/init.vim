source ~/.vimrc

" Exit terminal by pressing ESC
tnoremap <silent> <C-[> <C-\><C-n>

" Moving around terminal mode
tnoremap <C-h> <C-\><c-n><C-w>h
tnoremap <C-j> <C-\><c-n><C-w>j
tnoremap <C-k> <C-\><c-n><C-w>k
tnoremap <C-l> <C-\><c-n><C-w>l

set inccommand=split

" open terminal on ctrl+t
nnoremap <c-t> :call OpenTerminal()<CR>
