---@module "lazy"
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("plugins.treesitter.install_parsers")
    require("plugins.treesitter.keymaps")
    require("plugins.treesitter.highlight")
  end,
}
