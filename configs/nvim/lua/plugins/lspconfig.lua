return {
  'neovim/nvim-lspconfig',

  config = function()
    local keymap = vim.keymap.set

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
