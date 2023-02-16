return {
  "NvChad/nvim-colorizer.lua",

  config = function()
    require("colorizer").setup {
      filetypes = { "css", "sass", "scss" },
      sass = { enable = true },
    }
  end,

  ft = { "css", "scss", "sass" }
}
