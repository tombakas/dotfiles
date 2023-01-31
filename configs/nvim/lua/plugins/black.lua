return {
  "psf/black",
  ft = { "python" },
  config = function()
    vim.g.black_virtualenv = vim.g.neovim_env
    vim.keymap.set("n", "<leader>bl", "<cmd>Black<cr>")
  end
}
