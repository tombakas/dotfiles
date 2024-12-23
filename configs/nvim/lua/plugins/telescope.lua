local find_command = {
  "fd",
  "--exclude",
  ".git",
  "--type",
  "f",
  "-H",
}

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ find_command = find_command })
        end,
        desc = "Find files",
      },
      {
        "<leader>t",
        function()
          require("telescope.builtin").find_files({ find_command = find_command })
        end,
        desc = "Find files",
      },
      {
        "<leader>fi",
        function()
          require("telescope.builtin").find_files({ find_command = find_command, no_ignore = true })
        end,
        desc = "Find files including the ones in .gitignore",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>a", "<cmd>Telescope live_grep<cr>" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>" },
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
      { "<leader>fp", "<cmd>Telescope projects<cr>" },
      { "<leader>fl", "<cmd>Telescope lsp_references<CR>" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>" },
      { '"?', "<cmd>Telescope registers<cr>" },
      { "<leader>fh", "<cmd>Telescope oldfiles<cr>" },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-telescope/telescope-fzf-native.nvim" },
      { "ahmedkhalf/project.nvim" },
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("projects")

      local action_layout = require("telescope.actions.layout")

      require("telescope").setup({
        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              i = {
                ["<C-x>"] = require("telescope.actions").delete_buffer,
              },
            },
          },
        },
        defaults = {
          mappings = {
            n = {
              ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
              ["<M-p>"] = action_layout.toggle_preview,
            },
          },
          path_display = {
            "truncate",
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
