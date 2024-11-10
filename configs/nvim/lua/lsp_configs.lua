local on_attach = require("utils").on_attach

local configs = {
  pyright = function()
    require 'lspconfig'.pyright.setup {
      on_attach = on_attach,
      settings = {
        python = {
          analysis = { typeCheckingMode = "off" }
        }
      }
    }
  end,

  lua_ls = function()
    require 'lspconfig'.lua_ls.setup {
      on_attach = on_attach,
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
            globals = { "vim", "Snacks" }
          }
        }
      }
    }
  end
}

return configs
