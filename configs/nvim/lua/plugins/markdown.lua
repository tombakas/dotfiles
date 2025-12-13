return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
  config = function()
    local presets = require("markview.presets")

    require("markview").setup({
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
        modes = { "i", "n", "no", "c" },
        hybrid_modes = { "i", "n" },
        linewise_hybrid_mode = true,
        debounce = 0
      },
      markdown = {
        list_items = {
          enable = true,
          shift_width = 2,
        },
      },
    })
  end,
}
