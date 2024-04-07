return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      python = { "flake8" },
      html = { "djlint" },
      htmldjango = { "djlint" }
    }

    local flake8 = require('lint').linters.flake8
    flake8.args = {
      '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
      '--extend-ignore=E203',
      '--no-show-source',
      '--stdin-display-name',
      function() return vim.api.nvim_buf_get_name(0) end,
      '-',
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
