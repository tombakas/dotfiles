return {
  "NvChad/nvim-colorizer.lua",

  config = function()
    require("colorizer").setup {
      user_default_options = {
        mode = "background",
        css = true,
        sass = { enable = true, parsers = { "css" } },
      }
    }
  end,

  ft = { "css", "scss", "sass" }
}
