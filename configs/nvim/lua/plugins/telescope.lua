return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { "<leader>t", '<cmd>Telescope find_files find_command=fd,--exclude,.git,--type,f<cr>' },
      { "<leader>y", '<cmd>Telescope find_files no_ignore=true find_command=fd,--exclude,.git,--type,f<cr>' },
      { "<leader>a", "<cmd>Telescope live_grep<cr>" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
      { "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>" },
      { "<leader>g", "<cmd>Telescope git_status<cr>" },
      { "<leader>rs", "<cmd>Telescope resume<cr>" },
      { "<F6>", "<cmd>Telescope grep_string<cr>" },
      { "\"\"", "<cmd>Telescope registers<cr>" },
      { "-", "<cmd>Telescope file_browser<cr>"},
      { "<up>", "<cmd>Telescope oldfiles<cr>"},
    },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim"  }
    },
    config = function()
      require("telescope").load_extension('file_browser')
      require("telescope").load_extension('fzf')

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false
            }
          }
        }
      })
    end
  },

  {
    'nvim-telescope/telescope-file-browser.nvim'
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
  }
}
