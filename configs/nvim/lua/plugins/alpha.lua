return {
  "goolord/alpha-nvim",
  config = function ()
    require'alpha'.setup(require'alpha.themes.startify'.config)

    vim.keymap.set("n", "<leader>;", "<cmd>Alpha<cr>")
  end
}
