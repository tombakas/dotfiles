return {
  "SmiteshP/nvim-navic",

  enabled = false,
  config = function ()
    require("nvim-navic").setup({
      highlight = true
    })
  end
}
