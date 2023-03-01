return {
  { 'ellisonleao/gruvbox.nvim', event = "BufLeave" },
  { 'folke/tokyonight.nvim', event = "BufLeave" },
  { 'catppuccin/nvim', event = "BufLeave" },
  { 'navarasu/onedark.nvim', event = "BufLeave" },
  { 'rebelot/kanagawa.nvim', event = "BufLeave" },
  { 'sainnhe/everforest', event = "BufLeave" },

  {
    'sheerun/vim-polyglot',
    event = "BufAdd",
    config = function()
      vim.g.python_highlight_file_headers_as_comments = 1
    end
  },
}
