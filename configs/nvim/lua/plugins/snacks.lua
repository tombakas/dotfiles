local function compute_dashboard_width(width)
  local win_width = vim.fn.winwidth(0)
  local padding = 4

  if win_width > width + padding then
    return width
  else
    return win_width - padding
  end
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      width = compute_dashboard_width(80),
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "header", padding = 4, enabled = vim.fn.winwidth(0) > 51 },
        { section = "keys", padding = 1 },
        { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
        { section = "recent_files", cwd = true, limit = 8, padding = 1 },
        { title = "MRU", padding = 1 },
        { section = "recent_files", limit = 8, padding = 1 },
      },
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>q",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>Q",
      function()
        Snacks.bufdelete()
        if vim.fn.winnr("$") > 1 then
          vim.api.nvim_win_close(0, false)
        end
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>gb",
      mode = "v",
      function()
        require("snacks").gitbrowse()
      end,
      desc = "Git browse",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>;",
      function()
        Snacks.dashboard.open()
      end,
      desc = "Open dashboard",
    },
  },
}
