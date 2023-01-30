return {
  "mhinz/vim-sayonara",

  config = function()
    local keymap = vim.keymap.set

    keymap("n", "<leader>Q", "<cmd>Sayonara<cr>")
    keymap("n", "<leader>q", "<cmd>Sayonara!<cr>")
  end
}
