return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
  config = function()
    require("markview").setup({
      preview = {
        modes = { "i", "n", "no", "c" },
        hybrid_modes = { "i", "n" },
      },
    })
  end,
}
