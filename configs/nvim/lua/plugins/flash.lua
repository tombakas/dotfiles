return {
  "folke/flash.nvim",
  event = "VeryLazy",

  opts = {
    modes = {
      char = {
        keys = { "s", "f", "F", "t", "T", ";" },
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
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  }
}
