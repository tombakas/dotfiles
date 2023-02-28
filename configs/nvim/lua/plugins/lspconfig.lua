return {
  'neovim/nvim-lspconfig',

  config = function()
    local keymap = vim.keymap.set

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end
    end


    require 'lspconfig'.tsserver.setup {
      on_attach = on_attach,
    }
    require 'lspconfig'.pyright.setup {
      on_attach = on_attach,
      settings = {
        python = {
          analysis = { typeCheckingMode = "off" }
        }
      }
    }

    require 'lspconfig'.yamlls.setup {}
    require 'lspconfig'.bashls.setup {}
    require 'lspconfig'.lua_ls.setup {
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
          },
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
