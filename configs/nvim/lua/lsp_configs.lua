local configs = {
  pyright = function()
    require("lspconfig").pyright.setup({
      settings = {
        python = {
          analysis = { typeCheckingMode = "off" },
        },
      },
    })
  end,

  lua_ls = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          format = {
            enable = true,
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
              tab_width = "2",
              continuation_indent = "2",
            },
          },
          diagnostics = {
            globals = { "vim", "Snacks" },
          },
        },
      },
    })
  end,
}

return configs
