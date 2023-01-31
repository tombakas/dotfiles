return {
  {
    "simnalamburt/vim-mundo",

    config = function()
      local keymap = vim.keymap.set

      keymap("n", "<leader>mt", "<cmd>MundoToggle<cr>")
    end
  }
}
