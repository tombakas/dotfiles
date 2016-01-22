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

NeoBundle 'tpope/vim-fugitive' " Git wrapper for vim
NeoBundle 'Lokaltog/vim-easymotion' " Fast way to get places; trigger with <leader><leader>w
NeoBundle 'mattn/emmet-vim'
NeoBundle 'jeetsukumaran/vim-filebeagle' " Simple wrapper for netrw
NeoBundle 'Shougo/unite.vim' " A wrapper for a bunch of stuff, like fuzzy file search and yank history
NeoBundle 'Shougo/neoyank.vim' " Yank history
NeoBundle 'Raimondi/delimitMate' " Auto add brackets

" YouCompleteMe
let g:neobundle#install_process_timeout = 1500
NeoBundle 'Valloric/YouCompleteMe', {
        \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
        \ }

NeoBundle 'simnalamburt/vim-mundo' " Undo history 
NeoBundle 'othree/html5.vim' " HTML5 syntax highliting and indentation
NeoBundle 'davidhalter/jedi-vim' " Wrapper for python syntax/autocompletion library Jedi
NeoBundle 'scrooloose/nerdcommenter' " Comment wrapper
NeoBundle 'tpope/vim-repeat' " Use . to repeat more complicated commands
NeoBundle 'cakebaker/scss-syntax.vim' " SCSS syntax highliting
NeoBundle 'SirVer/ultisnips' " Snippets for code completion
NeoBundle 'honza/vim-snippets' " Snippet library
NeoBundle 'scrooloose/syntastic' " Syntax
NeoBundle 'majutsushi/tagbar' " Tag browser
NeoBundle 'pangloss/vim-javascript' " Javascript syntax
NeoBundle 'tpope/vim-surround' " Wrapper for surrounding objects with quotes, tags, etc.

" Vim utility functions
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'vim-scripts/tlib'
NeoBundle 'tpope/vim-haml'
NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }

NeoBundle 'bling/vim-airline' " Statusline
NeoBundle 'nathanaelkane/vim-indent-guides' " Highlight levels of indentation
NeoBundle 'tmhedberg/SimpylFold' " Python folding
NeoBundle 'nvie/vim-flake8' " pep8 syntax
NeoBundle 'hynek/vim-python-pep8-indent' " pep8 indentation
NeoBundle 'Valloric/MatchTagAlways' " Highlighting matching XML tags
NeoBundle 'vim-scripts/fountain.vim' " Fountain syntax highlighting

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

filetype plugin indent on

set ai " auto indentingGc
set history=100 " keep 100 lines of history
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
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set backspace=2
set laststatus=2
set relativenumber
set undofile " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo
set wildignorecase

nnoremap / /\v
vnoremap / /\v
let mapleader = ","
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1

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

map <leader>gg :GundoToggle<CR>

" pipe through bc
imap <C-p> <ESC>:.! sed 's/^/scale=2;/' \| bc -l<CR>

"taglist
nnoremap <F3> :TagbarToggle<CR>

"jedi
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1

"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <C-d> <Plug>delimitMateS-BS

"airline
let g:airline_theme="powerlineish"

" emmet
imap <leader>h <plug>(emmet-expand-abbr)
imap <C-j> <plug>(emmet-move-next)
imap <C-k> <plug>(emmet-move-prev)

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
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <buffer> <C-r>   <Plug>(unite_redraw)
endfunction
nmap <leader>be :Unite buffer<CR>
"unite ack
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden '
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup',  '--hidden', '-g', '']
endif
"Remove filebeagle mapping
noremap <leader>f :<C-u>Unite grep:.<CR>
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
nmap <leader>s :SyntasticReset<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Default html files to javascripthtml
au BufRead *.html set filetype=html.javascript

" Fountain
au BufRead,BufNewFile *.fountain setfiletype fountain

" All html is djangohtml
au BufNewFile,BufRead *.html set filetype=htmldjango

" Ultisnips
"let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
let g:UltiSnipsExpandTrigger='<C-]>' "Trigger snippet
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Tell flake8 to ignore lines above 80 chars long
let g:syntastic_python_flake8_args='--ignore=E501'

" Filebeagle
let g:filebeagle_suppress_keymaps=1
map <silent> -  <Plug>FileBeagleOpenCurrentWorkingDir

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
