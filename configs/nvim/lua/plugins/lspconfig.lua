return {
  "neovim/nvim-lspconfig",

  config = function()
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  end,
}
