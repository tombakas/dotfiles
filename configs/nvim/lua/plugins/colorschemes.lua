return {
  'ellisonleao/gruvbox.nvim',
  'folke/tokyonight.nvim',
  'catppuccin/nvim',
  'navarasu/onedark.nvim',
  'rebelot/kanagawa.nvim',
  'sainnhe/everforest',

  {
    'sheerun/vim-polyglot',
    event = "BufAdd",
    config = function()
      vim.g.python_highlight_file_headers_as_comments = 1
    end
  },
}
