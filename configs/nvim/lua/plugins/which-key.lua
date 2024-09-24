return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
        win = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        disable = { filetypes = { "TelescopePrompt" } },
      })
  end,
}
