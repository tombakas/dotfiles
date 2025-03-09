return {
  -- Top Pickers & Explorer
  { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
  { "<leader>t",  function() Snacks.picker.smart() end, desc = "Smart Find Files" },
  { "<leader>a",  function() Snacks.picker.grep() end, desc = "Grep" },
  { "<leader>f:", function() Snacks.picker.command_history() end, desc = "Command History" },
  { "<leader>n",  function() Snacks.picker.notifications() end, desc = "Notification History" },
  { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
  { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
  { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
  { "<leader>fh", function() Snacks.picker.recent() end, desc = "Recent" },
  { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status", },
  { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log", },
  { "<leader>ft", require("plugins.snacks.pickers").fileTypePicker, desc = "File types", },

  -- Grep
  { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", },
  { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
  { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, },

  -- search
  { '<leader>"',  function() Snacks.picker.registers() end, desc = "Registers", },
  { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", },
  { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights", },
  { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
  { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", },
  { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
  { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
  { "<leader>rs", function() Snacks.picker.resume() end, desc = "Resume", },

  -- LSP
  { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols", },
  { "<leader>q",  function() Snacks.bufdelete() end, desc = "Delete Buffer", },
  { "<leader>Q",
    function()
      Snacks.bufdelete()
      if vim.fn.winnr("$") > 1 then
        vim.api.nvim_win_close(0, false)
      end
      end,
    desc = "Delete Buffer",
  },
  { "<leader>gb", mode = "v", function() require("snacks").gitbrowse() end, desc = "Git browse", },
  { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
  { "<leader>;", function() Snacks.dashboard.open() end, desc = "Open dashboard", },
}
