" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
set nocompatible " Be iMproved

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'ervandew/supertab'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'beloglazov/vim-online-thesaurus'
NeoBundle 'vim-scripts/fountain.vim'
NeoBundle 'junegunn/goyo.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

filetype plugin indent on

set ai " auto indentingGc
set history=100 " keep 100 lines of history syntax on " syntax highlighting
set hlsearch " highlight the last searched term

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

set t_Co=256
colo Mustang
syntax enable
set number
set foldmethod=indent
set foldlevel=99
" remap folding
nnoremap <space> za
vnoremap <space> zf

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8 fileencodings=.
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo

nnoremap / /\v
vnoremap / /\v
let mapleader = ","
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set noerrorbells " don't beep
set novb
set pastetoggle=<F2>

cmap w!! %!sudo tee > /dev/null %

setlocal omnifunc=syntaxcomplete#Complete

map <leader>N :NERDTreeToggle<CR>
map <leader>gg :GundoToggle<CR>
" pipe through bc
imap <C-p> <ESC>:.! sed 's/^/scale=2;/' \| bc -l<CR>

let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabCrMapping = 1

"window resizing
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

"taglist
nnoremap <F3> :TagbarToggle<CR>

"gundo
nnoremap <F5> :GundoToggle<CR>

" indent guide
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" argument suggestions
set completeopt+=preview

" run python from file
" map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" simply fold
let g:SimpylFold_docstring_preview = 1

" unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<CR>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-r>   <Plug>(unite_redraw)
endfunction
nmap <leader>be :Unite buffer<CR>
"unite ack
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --nogroup --nocolor --hidden'
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
endif
nnoremap <leader>f :<C-u>Unite grep:.<CR>
nnoremap <leader>F :<C-u>Unite grep:%<CR>
"yank history
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Shorten lines above 80 characters sensibly
nmap <C-S-x> 80<S-\|>2<S-B>Eldwi<CR><ESC>

" Next and previous buffer mappigns
nmap <leader>m :bp<CR>
map <leader>. :bn<CR>

" Syntastic lnext lprev
nmap <leader>[ :lprev<CR>
nmap <leader>] :lnext<CR>

" Thesaurus
nmap <leader>k :OnlineThesaurusCurrentWord<cr>

" Default html files to javascripthtml
au BufRead *.html set filetype=html.javascript

" Fountain
au BufRead,BufNewFile *.fountain setfiletype fountain

" All html is djangohtml
au BufNewFile,BufRead *.html set filetype=htmldjango
