return {
  "sbdchd/neoformat",

  config = function()
    vim.g.neoformat_lua_stylua = {
      exe = "stylua",
      args = { "--indent-type", "Spaces", "--indent-width", "2", "-" },
      stdin = 1,
    }

    vim.keymap.set("n", "<leader>nf", "<cmd>Neoformat<cr>")
  end,
}
