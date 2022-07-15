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
Plug 'justinmk/vim-sneak'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'PsychoLlama/teleport.vim'
Plug 'mhinz/vim-sayonara'
Plug 'andymass/vim-matchup'

" Colors
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sheerun/vim-polyglot' " Universal syntax coloring scheme management

" Language specific plugins
Plug 'vim-scripts/fountain.vim' " Fountain syntax highlighting
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim' " Typescript syntax
Plug 'psf/black', { 'for': 'python' } " Opinionated Python formatting
Plug 'hynek/vim-python-pep8-indent' " pep8 indentation
Plug 'rhysd/vim-clang-format' " C style languages
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'lervag/vimtex'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'mattn/emmet-vim', {'for': ['html', 'htmldjango', 'css', 'xml', 'vue', 'scss', 'less']}
Plug 'sbdchd/neoformat'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

" Completion config
Plug 'fhill2/telescope-ultisnips.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
