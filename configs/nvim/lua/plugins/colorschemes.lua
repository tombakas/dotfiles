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

local plugins = {}

for _, value in pairs(colorschemes) do
  table.insert(plugins, { value, event = "BufLeave" })
end

return plugins
