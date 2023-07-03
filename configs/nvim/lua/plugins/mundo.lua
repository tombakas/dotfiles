return {
  {
    "simnalamburt/vim-mundo",

    config = function()
      local keymap = vim.keymap.set

      keymap("n", "<leader>u", "<cmd>MundoToggle<cr>")
    end
  }
}
