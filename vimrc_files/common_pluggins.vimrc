Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'Lokaltog/vim-easymotion' " Fast way to get places; trigger with <leader><leader>w
Plug 'mattn/emmet-vim'
Plug 'jeetsukumaran/vim-filebeagle' " Simple wrapper for netrw
Plug 'jiangmiao/auto-pairs' " Auto add brackets
Plug 'w0rp/ale' " Syntax
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --racer-completer'} " YouCompleteMe
Plug 'simnalamburt/vim-mundo' " Undo history
Plug 'scrooloose/nerdcommenter' " Comment wrapper
Plug 'tpope/vim-repeat' " Use . to repeat more complicated commands
Plug 'SirVer/ultisnips' " Snippets for code completion
Plug 'honza/vim-snippets' " Snippet library
Plug 'majutsushi/tagbar' " Tag browser
Plug 'tpope/vim-surround' " Wrapper for surrounding objects with quotes, tags, etc.

" Vim utility functions
Plug 'vim-scripts/tlib'
Plug 'tpope/vim-haml'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline
Plug 'nathanaelkane/vim-indent-guides' " Highlight levels of indentation
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mkitt/tabline.vim'

" Colors
Plug 'NLKNguyen/papercolor-theme'

" Language specific plugins
Plug 'davidhalter/jedi-vim' " Wrapper for python syntax/autocompletion library Jedi
Plug 'othree/html5.vim' " HTML5 syntax highliting and indentation
Plug 'cakebaker/scss-syntax.vim' " SCSS syntax highliting
Plug 'pangloss/vim-javascript' " Javascript syntax
Plug 'hynek/vim-python-pep8-indent' " pep8 indentation
Plug 'vim-scripts/fountain.vim' " Fountain syntax highlighting
Plug 'Valloric/MatchTagAlways' " Highlighting matching XML tags
Plug 'rust-lang/rust.vim'
