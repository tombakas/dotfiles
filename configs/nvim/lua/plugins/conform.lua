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

      formatters_by_ft = {
        html = { "djlint" },
        htmldjango = { "djlint" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        sql = { "sqlfluff" },
        markdown = { "injected" },
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
          args = { "fix", "--dialect=postgres", "--exclude-rules=AM04", "-" },
          stdin = true,
          require_cwd = false,
        },
      },
    })
  end,
}
