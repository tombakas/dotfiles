local colorschemes = {
  "EdenEast/nightfox.nvim",
  "arcticicestudio/nord-vim",
  "catppuccin/nvim",
  "sainnhe/gruvbox-material",
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
  "rebelot/kanagawa.nvim",
  "sainnhe/everforest",
  "sainnhe/sonokai",
}

local plugins = {
  {
    "sheerun/vim-polyglot",
    event = "BufAdd",
    config = function()
      vim.g.python_highlight_file_headers_as_comments = 1
    end
  },
}

for _, value in pairs(colorschemes) do
  table.insert(plugins, { value, event = "BufLeave" })
end

return plugins
