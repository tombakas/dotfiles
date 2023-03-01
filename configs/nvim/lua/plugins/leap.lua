return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.opts.special_keys.prev_group = '<S-tab>'
    leap.opts.special_keys.next_group = '<tab>'
    leap.add_default_mappings()
  end
}
