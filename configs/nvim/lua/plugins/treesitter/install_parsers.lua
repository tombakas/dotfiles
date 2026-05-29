-- Install core parsers after lazy.nvim finishes loading all plugins
local ts = require("nvim-treesitter")

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  once = true,
  callback = function()
    ts.install({
      "bash",
      "comment",
      "css",
      "diff",
      "fish",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "html",
      "javascript",
      "json",
      "latex",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "norg",
      "python",
      "query",
      "regex",
      "scss",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "typst",
      "vim",
      "vimdoc",
      "vue",
      "xml",
    }, {
        max_jobs = 8,
      })
  end,
})
