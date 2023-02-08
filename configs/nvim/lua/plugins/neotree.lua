return {
  "nvim-neo-tree/neo-tree.nvim",

  dependencies = { "MunifTanjim/nui.nvim", module = "nui" },

  keys = {
    { "<leader>n", "<cmd>NeoTreeShowToggle<cr>" }
  },

  config = function()
    vim.g.neo_tree_remove_legacy_commands = true
  end,
}
