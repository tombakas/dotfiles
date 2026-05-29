---@module "lazy"
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 4,
        multiline_threshold = 2,
      },
    },
  },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("plugins.treesitter.install_parsers")
    require("plugins.treesitter.keymaps")
    require("plugins.treesitter.highlight")
  end,
}
