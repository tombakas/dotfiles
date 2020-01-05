nnoremap <space> za
vnoremap <space> zf

nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

imap jj <ESC>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ag for highlighted
nnoremap <F6> :Ag <C-r>=expand("<cword>")<CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Remove buffer, but keep split/window
nnoremap <C-b>bd :bp\|bd #<CR>

" Shorten lines above 80 characters sensibly
nmap <C-S-x> 80<S-\|>2<S-B>Eldwi<CR><ESC>

" Save files requiring elevated permissions
cmap w!! %!sudo tee > /dev/null %

" Next and previous buffer mappigns
nmap <leader>m :bp<CR>
map <leader>. :bn<CR>
