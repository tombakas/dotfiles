return {
  dependencies = {
    {
      "tommcdo/vim-fubitive",
    }
  },

  "tpope/vim-fugitive",

  keys = {
    {
      "<leader>G",
      function()
        local status, _ = pcall(vim.cmd.G)
        if (status ~= true) then
          print("Not a git directory")
        end
      end
    }
  },
  event = "BufNew",
  cmd = "G"
}
