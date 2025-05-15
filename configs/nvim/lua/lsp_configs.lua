vim.lsp.config["pyright"] = {
  settings = {
    python = {
      analysis = { typeCheckingMode = "off" },
    },
  },
}
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
vim.lsp.config["volar"] = {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
}

local on_publish_diagnostics = vim.lsp.diagnostic.on_publish_diagnostics
vim.lsp.config["bashls"] = {
  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, res, ...)
      local file_name = vim.fn.fnamemodify(vim.uri_to_fname(res.uri), ":t")
      if string.match(file_name, "^%.env") == nil then
        return on_publish_diagnostics(err, res, ...)
      end
    end,
  },
}
