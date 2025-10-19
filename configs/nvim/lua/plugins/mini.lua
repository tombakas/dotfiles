return {
  {
    "nvim-mini/mini.nvim",
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

      require("mini.surround").setup({
        mappings = {
          add = "ys", -- Add surrounding in Normal and Visual modes
          delete = "ds", -- Delete surrounding
          find = "", -- Find surrounding (to the right)
          find_left = "", -- Find surrounding (to the left)
          highlight = "", -- Highlight surrounding
          replace = "cs", -- Replace surrounding

          suffix_last = "", -- Suffix to search with "prev" method
          suffix_next = "", -- Suffix to search with "next" method
        },
      })

      require("mini.pairs").setup({
        mappings = {
          [" "] = { action = "open", pair = "  ", neigh_pattern = "[{()}].", register = { cr = true } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\^`].", register = { cr = false } },
          ["\""] = { action = "closeopen", pair = "\"\"", neigh_pattern = "[^\\\"].", register = { cr = false } },
        },
      })

      vim.keymap.set("n", "<leader>q", function()
        if vim.fn.winnr("$") > 1 then
          require("mini.bufremove").unshow(0)
        else
          vim.api.nvim_win_close(0, false)
        end
      end)
      vim.keymap.set("n", "<leader>Q", function()
        require("mini.bufremove").delete(0)
      end)

      -- files
      require("mini.files").setup({
        vim.keymap.set("n", "-", function()
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
