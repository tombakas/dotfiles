local CC_config = require("plugins.ai.config")

local opts = {
  display = {
    action_palette = {
      provider = "snacks",
    },
  },
}

if CC_config and CC_config.strategies and CC_config.adapters then
  opts.strategies = CC_config.strategies
  opts.adapters = CC_config.adapters
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = "v17.33.0",
  keys = {
    { "<leader>cc", ":CodeCompanionChat Toggle<cr>", desc = "Code companion chat" },
    { "<leader>ca", ":CodeCompanionActions<cr>", desc = "Code companion actions" },
  },
  opts = opts,
}
