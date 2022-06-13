lua << EOF
-- Lua
local palette = require("onedark.palette")

require('onedark').setup  {
  -- Main options --
    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    toggle_style_key = '<leader>od', -- Default keybinding to toggle
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  highlights = {
      djangoStatement = {fg = palette.dark.red, fmt = "bold"},
      djangoTagBlock = {fg = palette.dark.orange, fmt = "bold"},
      djangoVarBlock = {fg = palette.dark.orange, fmt = "bold"},
      DiagnosticsUnderlineError = {fg = palette.dark.red},
      MatchParen = {bg=palette.dark.bg2}
  },

  -- Plugins Config --
  diagnostics = {
    darker = false, -- darker colors for diagnostic
    undercurl = true,   -- use undercurl instead of underline for diagnostics
    background = true,    -- use background color for virtual text
  },
}
require('onedark').load()
EOF
