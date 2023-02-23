return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim"
  },

  config = function()
    require("mason").setup()

    require("mason-null-ls").setup({
      ensure_installed = { "flake8", "black", "shellcheck", "isort" }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver", "yamlls", "bashls" }
    })

    require("mason-nvim-dap").setup({
      ensure_installed = { 'python' },
      automatic_setup = true,
    })
  end
}