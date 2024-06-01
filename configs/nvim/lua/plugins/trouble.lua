return {
  "folke/trouble.nvim",
  opts = {
    mode = "document_diagnostics"
  },
  keys = {
    {
      "<leader><leader>t",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
  },

  cmd = "Trouble"
}
