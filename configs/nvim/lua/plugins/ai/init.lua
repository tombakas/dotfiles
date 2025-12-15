local CC_config = require("plugins.ai.config")

local opts = {
  display = {
    action_palette = {
      provider = "snacks",
    },
  },
}

if CC_config then
  for k, v in pairs(CC_config) do
    opts[k] = v
  end
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = "*",
  keys = {
    { "<leader>cc", ":CodeCompanionChat Toggle<cr>", desc = "Code companion chat" },
    { "<leader>ca", ":CodeCompanionActions<cr>", desc = "Code companion actions" },
  },
  opts = opts,
}
