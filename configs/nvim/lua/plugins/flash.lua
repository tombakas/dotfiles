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
      "<c-/>",
      mode = { "n" },
      function()
        local resp = require("flash").toggle()
        print("Flash is " .. (resp and "on" or "off"))
      end,
      desc = "Toggle flash.nvim",
    },
    {
      "s",
      mode = { "n", "x" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  }
}
