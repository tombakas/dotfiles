Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'tpope/vim-surround' " Wrapper for surrounding objects with quotes, tags, etc.
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary' " Comment wrapper
Plug 'tpope/vim-repeat' " Use . to repeat more complicated commands
Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango', 'css', 'xml']}
Plug 'jiangmiao/auto-pairs' " Auto add brackets
Plug 'w0rp/ale' " Syntax
Plug 'simnalamburt/vim-mundo' " Undo history
Plug 'SirVer/ultisnips' " Snippets for code completion
Plug 'honza/vim-snippets' " Snippet library
Plug 'majutsushi/tagbar' " Tag browser
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'wellle/targets.vim'

" Vim utility functions
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline
Plug 'nathanaelkane/vim-indent-guides' " Highlight levels of indentation
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Colors
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

" Language specific plugins
Plug 'davidhalter/jedi-vim' " Wrapper for python syntax/autocompletion library Jedi
Plug 'othree/html5.vim' " HTML5 syntax highliting and indentation
Plug 'hynek/vim-python-pep8-indent' " pep8 indentation
Plug 'vim-scripts/fountain.vim' " Fountain syntax highlighting
Plug 'Valloric/MatchTagAlways' " Highlighting matching XML tags
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim' " Typescript syntax
Plug 'carlitux/deoplete-ternjs' " Javascript completion
Plug 'ambv/black' " Opinionated Python formatting
Plug 'rhysd/vim-clang-format' " C style languages
Plug 'sheerun/vim-polyglot' " Universal syntax coloring scheme management
Plug 'lervag/vimtex'
