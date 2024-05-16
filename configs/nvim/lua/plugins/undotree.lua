return {
  {
    "mbbill/undotree",

    config = function()
      local keymap = vim.keymap.set

      keymap("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
    end,
  },
}
