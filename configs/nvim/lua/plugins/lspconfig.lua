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
      ensure_installed = { "flake8", "black" }
    })
    require("mason-lspconfig").setup({
      ensure_installed = { "sumneko_lua", "pyright", "tsserver", "yamlls" }
    })

    require 'lspconfig'.tsserver.setup {}
    require 'lspconfig'.pyright.setup {
      settings = {
        python = {
          analysis = { typeCheckingMode = "off" }
        }
      }
    }

    require 'lspconfig'.yamlls.setup {}
    require 'lspconfig'.sumneko_lua.setup {
      settings = {
        Lua = {
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
              tab_width = "2",
              continuation_indent = "2",
            }
          }
        }
      }
    }

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
