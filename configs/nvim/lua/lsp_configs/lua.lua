vim.lsp.config["lua_ls"] = {
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
}
