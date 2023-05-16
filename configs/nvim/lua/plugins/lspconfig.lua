return {
  'neovim/nvim-lspconfig',

  config = function()
    local keymap = vim.keymap.set

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
