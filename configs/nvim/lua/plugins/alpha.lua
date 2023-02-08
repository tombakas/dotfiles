return {
  "goolord/alpha-nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb",
  config = function ()
    require'alpha'.setup(require'alpha.themes.startify'.config)

    vim.keymap.set("n", "<leader>;", "<cmd>Alpha<cr>")
  end
}
