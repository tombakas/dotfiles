let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-y> deoplete#close_popup()."\<ESC>"

call deoplete#custom#source('ultisnips', 'matchers', ['matcher_full_fuzzy'])
