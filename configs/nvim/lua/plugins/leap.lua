return {
  "ggandor/leap.nvim",

  dependencies = {
    "ggandor/flit.nvim"
  },

  config = function()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },

      -- A string like "nv", "nvo", "o", etc.
      labeled_modes = "nv",
      multiline = true
    }

    leap = require('leap')
    leap.opts.special_keys.prev_group = '<S-tab>'
    leap.opts.special_keys.next_group = '<tab>'
    leap.add_default_mappings()

  end
}
