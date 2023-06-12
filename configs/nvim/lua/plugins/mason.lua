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
      ensure_installed = { "flake8", "black", "shellcheck", "isort", "autopep8" }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "tsserver", "yamlls", "bashls" }
    })

    require("mason-lspconfig").setup_handlers(vim.tbl_extend(
      "keep",

      -- The default handler taht will be called for each installed server
      -- that doesn't have a dedicated handler.
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

    require("mason-nvim-dap").setup({
      ensure_installed = { 'python' },
      automatic_setup = true,
    })
  end
}
