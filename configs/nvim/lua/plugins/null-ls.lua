return {
  "jose-elias-alvarez/null-ls.nvim",

  dependencies = {
      'jay-babu/mason-null-ls.nvim',
  },

  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.flake8,
      },
    })
  end
}
