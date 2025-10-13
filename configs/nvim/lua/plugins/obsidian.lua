return {
  "obsidian-nvim/obsidian.nvim",
  version = "v3.13.1", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  --
  keys = {
    {
      "<leader>On",
      function()
        vim.cmd("Obsidian new")
      end,
      desc = "Obsidian new",
    },
    {
      "<leader>Os",
      function()
        vim.cmd("Obsidian search")
      end,
      desc = "Obsidian search",
    },
    {
      "<leader>Ob",
      function()
        vim.cmd("Obsidian backlinks")
      end,
      desc = "Obsidian backlinks",
    },
    {
      "<leader>Od",
      function()
        vim.cmd("Obsidian today")
      end,
      desc = "Obsidian daily",
    },
  },
  opts = {
    workspaces = {
      {
        name = "default",
        path = "~/Documents/Obsidian/",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
    legacy_commands = false,
    ui = { enable = false },
    open = {
      use_advanced_uri = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
    checkbox = {
      order = { " ", "x" },
    },
  },
}
