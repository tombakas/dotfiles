" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

call plug#begin('~/.vim/plugged')

source $DOTFILE_DIR/vimrc_files/common_pluggins.vimrc

call plug#end()

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
set ttyfast
set ruler
set backspace=indent,eol,start
set backspace=2
set laststatus=2
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

imap jj <ESC>

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

"taglist
nnoremap <F3> :TagbarToggle<CR>

"jedi
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 1
let g:jedi#smart_auto_mappings = 0

"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
imap <C-d> <Plug>delimitMateS-BS
imap <C-l> <Plug>delimitMateJumpMany

"airline
let g:airline_theme="powerlineish"
let g:airline_right_sep=''

" emmet
autocmd FileType html,htmldjango imap <C-h> <plug>(emmet-expand-abbr)
autocmd FileType html,htmldjango imap <C-j> <plug>(emmet-move-next)
autocmd FileType html,htmldjango imap <C-k> <plug>(emmet-move-prev)

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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Default html files to javascripthtml
au BufRead *.html set filetype=html.javascript

" fzf
nmap <leader>t :FZF<CR>
nmap <leader>be :Buffers<CR>

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
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_global_ycm_extra_conf = './.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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

" Python fold method
au FileType python set foldmethod=expr

" Indentation for yaml
au BufRead *.yml call SetRubyOptions()
function SetRubyOptions()
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
endfunction

" Flake8 python version hack
function! Setup_flake8()

    let g:pversion=strpart(split(system("python --version 2>&1"))[1], 0, 1)

    if g:pversion == 2
        let output=system("/usr/bin/python2 -m flake8 -h")
        if !v:shell_error
            let g:syntastic_python_flake8_exe="/usr/bin/python2 -m flake8"
            return
        endif
    elseif g:pversion == 3
        let output=system("/usr/bin/python3 -m flake8 -h")
        if !v:shell_error
            let g:syntastic_python_flake8_exe="/usr/bin/python3 -m flake8"
            return
        endif
    endif

    let output=system("echo -n $(which python)" . " -m flake8 -h")
    if v:shell_error
        let g:syntastic_python_flake8_exe=system("echo -n $(which python)" . " -m flake8")
        return
    endif

    let output=system("which flake8")
    if !v:shell_error
        let g:syntastic_python_flake8_exe="flake8"
        return
    endif

    let output=system("echo -n $(which python)" . " -m pyflakes -h")
    if !v:shell_error
        let g:syntastic_python_flake8_exe=system("echo -n $(which python)" . " -m pyflakes")
        return
    endif
endfunction
call Setup_flake8()


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

command! FZFLines call fzf#run({
            \   'source':  <sid>buffer_lines(),
            \   'sink':    function('<sid>line_handler'),
            \   'options': '--extended --nth=3..',
            \   'down':    '60%'
            \})

nnoremap <leader>f :FZFLines<CR>