return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    "jose-elias-alvarez/null-ls.nvim",
  },

  config = function()
    local null_ls = require("null-ls")
    local null_ls_packages = { "autopep8", "black", "flake8", "isort", "prettier", "shellcheck" }
    local lspconfig_packages = { "bashls", "lua_ls", "pyright", "tsserver", "yamlls" }

    null_ls.setup()
    require("mason").setup()

    ----------- null_ls
    require("mason-null-ls").setup({
      ensure_installed = null_ls_packages,
      handlers = {
        -- Custom null-ls handler configs go here
        flake8 = function()
          null_ls.register(null_ls.builtins.diagnostics.flake8.with({
            extra_args = { "--max-line-length", "120" }
          }))
        end,
      }
    })

    ----------- lspconfig
    require("mason-lspconfig").setup({
      ensure_installed = lspconfig_packages
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

    ----------- nvim-dap
    require("mason-nvim-dap").setup({
      ensure_installed = { "python" },
      automatic_setup = true,
    })
  end
}
