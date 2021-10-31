Plug 'tpope/vim-fugitive' " Git wrapper for vim
Plug 'tpope/vim-surround' " Wrapper for surrounding objects with quotes, tags, etc.
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary' " Comment wrapper
Plug 'tpope/vim-repeat' " Use . to repeat more complicated commands
Plug 'windwp/nvim-autopairs' " Auto add brackets
Plug 'simnalamburt/vim-mundo' " Undo history
Plug 'SirVer/ultisnips' " Snippets for code completion
Plug 'honza/vim-snippets' " Snippet library
Plug 'majutsushi/tagbar' " Tag browser
Plug 'wellle/targets.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline' " Statusline
Plug 'vim-airline/vim-airline-themes' " Statusline
Plug 'nathanaelkane/vim-indent-guides' " Highlight levels of indentation
Plug 'hynek/vim-python-pep8-indent' " pep8 indentation
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'justinmk/vim-sneak'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'PsychoLlama/teleport.vim'

" Colors
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot' " Universal syntax coloring scheme management

" Language specific plugins
Plug 'vim-scripts/fountain.vim' " Fountain syntax highlighting
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim' " Typescript syntax
Plug 'psf/black', { 'for': 'python' } " Opinionated Python formatting
Plug 'rhysd/vim-clang-format' " C style languages
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango', 'css', 'xml', 'vue', 'scss', 'less']}

" Completion config
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
