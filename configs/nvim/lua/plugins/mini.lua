return {
  {
    'echasnovski/mini.nvim',
    version = false,
    event = "VeryLazy",
    config = function()

      --  ai (targets)
      require('mini.ai').setup({
        search_method = 'cover_or_nearest',
        n_lines = 2000
      })

      -- files
      require('mini.files').setup({
        vim.keymap.set("n", "<leader>-", function()
          local file = vim.api.nvim_buf_get_name(0)
          if file then
            require("mini.files").open(file)
          else
            require("mini.files").open()
          end
        end)
      })
    end
  },
}
