return {
  "stevearc/conform.nvim",
  keys = {
    {
      mode = { "n", "v" },
      "<leader><leader>f",
      function()
        require("conform").format({ lsp_fallback = true, timeout_ms = 3000 })
      end,
    },
  },

  config = function()
    require("conform").setup({

      formatters_by_ft = {
        sql = { "sqlfluff" },
        python = { "ruff_organize_imports", "ruff_format" },
        markdown = { "injected" },
        lua = { "stylua" },
        less = { "stylelint" },
        javascript = { "prettier" },
        htmldjango = { "djlint" },
        html = { "djlint" },
      },

      formatters = {
        injected = {

          options = {
            -- Set to true to ignore errors
            ignore_errors = false,
            -- Map of treesitter language to file extension
            -- A temporary file name with this extension will be generated during formatting
            -- because some formatters care about the filename.
            lang_to_ext = {
              bash = "sh",
              c_sharp = "cs",
              elixir = "exs",
              javascript = "js",
              julia = "jl",
              latex = "tex",
              markdown = "md",
              python = "py",
              ruby = "rb",
              rust = "rs",
              teal = "tl",
              typescript = "ts",
              sql = "sql",
            },
            -- Map of treesitter language to formatters to use
            -- (defaults to the value from formatters_by_ft)
            lang_to_formatters = {},
          },
        },

        djlint = {
          prepend_args = { "--indent", "2" },
        },

        sqlfluff = {
          inherit = false,

          command = "sqlfluff",
          args = { "format", "--dialect=postgres", "--exclude-rules=AM04", "-" },
          stdin = true,
          timeout_ms = nil,
          require_cwd = false,
        },
      },
    })
  end,
}
