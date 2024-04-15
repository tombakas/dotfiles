return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>t", "<cmd>Telescope find_files find_command=fd,--exclude,.git,--type,f,-H<cr>" },
      { "<leader>y", "<cmd>Telescope find_files no_ignore=true find_command=fd,--exclude,.git,--type,f<cr>" },
      { "<leader>a", "<cmd>Telescope live_grep<cr>" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
      { "<leader>be", "<cmd>Telescope buffers<cr>" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
      { "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>" },
      {
        "<leader>gs",
        function()
          local status, _ = pcall(require("telescope.builtin").git_status)
          if not status then
            print("Not a git directory")
          end
        end,
        desc = "Git status",
      },
      {
        "<leader>gb",
        function()
          local status, _ = pcall(require("telescope.builtin").git_branches)
          if not status then
            print("Not a git directory")
          end
        end,
        desc = "Git branches",
      },
      { "<leader>rs", "<cmd>Telescope resume<cr>" },
      { "<leader>p", "<cmd>Telescope projects<cr>" },
      { "<leader>fr", "<cmd>Telescope lsp_references<CR>" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>" },
      { '"?', "<cmd>Telescope registers<cr>" },
      { "-", "<cmd>Telescope file_browser<cr>" },
      { "<leader>fh", "<cmd>Telescope oldfiles<cr>" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "ahmedkhalf/project.nvim" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("projects")

      require("telescope").setup({
        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              i = {
                ["<C-x>"] = require("telescope.actions").delete_buffer
              }
            }
          }
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
