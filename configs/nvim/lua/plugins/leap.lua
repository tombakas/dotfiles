return {
  "ggandor/leap.nvim",

  dependencies = {
    "ggandor/flit.nvim"
  },

  commit = "a706fea726179be91af75f4030a7b65a6adafa90",
  config = function()
    require('flit').setup {
      keys = { f = 'f', F = 'F', t = 't', T = 'T' },

      -- A string like "nv", "nvo", "o", etc.
      labeled_modes = "nvo",
      multiline = true
    }

    local leap = require('leap')
    leap.opts.special_keys.prev_group = '<S-tab>'
    leap.opts.special_keys.next_group = '<tab>'
    leap.add_default_mappings()

  end
}
