return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      --  ai (targets)
      require("mini.ai").setup({
        search_method = "cover_or_nearest",
        n_lines = 2000,
      })

      -- Navigation mappings using angled brackets
      require("mini.bracketed").setup()

      -- Sane default config
      require("mini.basics").setup({
        vim.keymap.set(
          "n",
          "[<space>",
          "v:lua.MiniBasics.put_empty_line(v:true)",
          { expr = true, desc = "Put empty line above" }
        ),
        vim.keymap.set(
          "n",
          "]<space>",
          "v:lua.MiniBasics.put_empty_line(v:false)",
          { expr = true, desc = "Put empty line above" }
        ),
      })

      -- files
      require("mini.files").setup({
        vim.keymap.set("n", "<leader>-", function()
          local file = vim.api.nvim_buf_get_name(0)
          if file then
            require("mini.files").open(file)
          else
            require("mini.files").open()
          end
        end),
      })
    end,
  },
}
