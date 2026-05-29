local lsp_servers = { "bashls", "lua_ls", "ts_ls", "vtsls", "yamlls" }

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
        "djlint",
        "flake8",
        "prettier",
        "ruff",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "stylelint",
        "stylua",
        "vue-language-server",
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = lsp_servers,
    })
  end
}
