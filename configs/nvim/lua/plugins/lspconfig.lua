return {
  'neovim/nvim-lspconfig',

  opts = {
    servers = {
      lua_ls = {},
      pyrights = {}
    }
  },

  config = function(_, opts)
    local keymap = vim.keymap.set
    local lspconfig = require('lspconfig')

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end
}
