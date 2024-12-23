return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },

  config = function()
    require("mason").setup()

    ----------- generic tools
    require('mason-tool-installer').setup {
      ensure_installed = {
        "black",
        "djlint",
        "flake8",
        "isort",
        "prettier",
        "shellcheck",
        "sqlfluff",
        "stylua",
      }
    }

    ----------- lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "bashls", "lua_ls", "pyright", "ts_ls", "yamlls" }
    })
    require("mason-lspconfig").setup_handlers(vim.tbl_extend(
      "keep",

      -- The default handler taht will be called for each installed server
      -- that doesn"t have a dedicated handler.
      {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            on_attach = require("utils").on_attach
          }
        end
      },

      -- Dedicated handlers for specific servers.
      require("lsp_configs"))
    )
  end
}
