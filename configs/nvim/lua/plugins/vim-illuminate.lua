return {
  "RRethy/vim-illuminate",

  keys = {
    { "<m-n>", function() require('illuminate').goto_next_reference() end },
    { "<m-p>", function() require('illuminate').goto_prev_reference() end }
  },

  event = "BufAdd",
}
