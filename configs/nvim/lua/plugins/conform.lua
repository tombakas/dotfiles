return {
  "stevearc/conform.nvim",
  keys = {
    {
      mode = { "n", "v" },
      "<leader><leader>f",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
    },
  },

  config = function()
    require("conform").setup({
      format_on_save = {
        enabled = false,
        lsp_fallback = true,
        timeout_ms = 500,
      },

      formatters_by_ft = {
        html = { "djlint" },
        htmldjango = { "djlint" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
      },

      formatters = {
        djlint = {
          prepend_args = { "--indent", "2" },
        },
      },
    })
  end,
}
