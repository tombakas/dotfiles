return {
  "folke/flash.nvim",
  event = "VeryLazy",

  opts = {
    modes = {
      char = {
        keys = { "s", "f", "F", "t", "T", ";", "," },
      },
    },
  },

  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  }
}
