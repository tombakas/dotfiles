local colorschemes = {
  "EdenEast/nightfox.nvim",
  "arcticicestudio/nord-vim",
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({ term_colors = true })
    end,
  },
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
  if type(value) == "table" then
    table.insert(plugins, vim.tbl_extend("force", value, { event = "BufLeave" }))
  else
    table.insert(plugins, { value, event = "BufLeave" })
  end
end

return plugins
