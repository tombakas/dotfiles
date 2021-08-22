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


syntax enable
if (has("termguicolors"))
    set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colo OceanicNext

if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:python3_host_prog  = $HOME . '/local/neovim_envs/neovim3/bin/python'
let g:python_host_prog  = $HOME . '/local/neovim_envs/neovim3/bin/python'

set number
set foldmethod=indent
set foldlevel=99

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

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set noerrorbells " don't beep
set novb
set pastetoggle=<F2>
set clipboard+=unnamedplus " Use unnamed register as system clipboard

setlocal omnifunc=syntaxcomplete#Complete

" argument suggestions
set completeopt=menuone,noselect
