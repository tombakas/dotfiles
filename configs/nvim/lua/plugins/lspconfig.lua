return {
  'neovim/nvim-lspconfig',

  dependencies = {
    "williamboman/mason.nvim",
    {
      'jay-babu/mason-null-ls.nvim',
      'williamboman/mason-lspconfig.nvim'
    }
  },

  config = function()
    local keymap = vim.keymap.set

    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = { "flake8" },
      ensure_installed = { "black" }
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "sumneko_lua", "pyright", "tsserver" },
    })

    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.sumneko_lua.setup{}

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
