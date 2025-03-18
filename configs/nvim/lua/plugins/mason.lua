local lsp_servers = { "bashls", "lua_ls", "pyright", "ts_ls", "yamlls", "volar" }

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
        "ruff",
        "djlint",
        "flake8",
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
