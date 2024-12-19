return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    require("mason").setup()

    ----------- generic tools
    require("mason-tool-installer").setup({
      ensure_installed = {
        "black",
        "djlint",
        "flake8",
        "isort",
        "prettier",
        "shellcheck",
        "sqlfluff",
        "stylua",
      },
    })

    ----------- lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = { "bashls", "lua_ls", "pyright", "ts_ls", "yamlls" },
    })
    require("mason-lspconfig").setup_handlers(require("lsp_configs"))
  end,
}
