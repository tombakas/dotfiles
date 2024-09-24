local colorschemes = {
  "EdenEast/nightfox.nvim",
  "arcticicestudio/nord-vim",
  "catppuccin/nvim",
  "ellisonleao/gruvbox.nvim",
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
  "projekt0n/github-nvim-theme",
  "rebelot/kanagawa.nvim",
  "sainnhe/everforest",
  "sainnhe/gruvbox-material",
  "sainnhe/sonokai",
}

local plugins = {}

for _, value in pairs(colorschemes) do
  table.insert(plugins, { value, event = "BufLeave" })
end

return plugins
