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
      "<c-_>",
      mode = { "n" },
      function()
        local resp = require("flash").toggle()
        print("Flash is " .. (resp and "on" or "off"))
      end,
      desc = "Toggle flash.nvim",
    },
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
