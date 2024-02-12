return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  config = function()
    require("ibl").setup({
      exclude = { filetypes = { "html", "htmldjango", "help", "txt", "rst" } },
      scope = { enabled = true },
    })
  end,
}
