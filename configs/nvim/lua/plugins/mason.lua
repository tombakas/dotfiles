local lsp_servers = { "bashls", "lua_ls", "pyright", "ts_ls", "yamlls" }

return {
  "mason-org/mason.nvim",

  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    require("mason").setup()

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

    require("mason-lspconfig").setup({
      ensure_installed = lsp_servers,
    })
  end
}
