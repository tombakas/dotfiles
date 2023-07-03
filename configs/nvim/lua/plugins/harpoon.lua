return {
  "ThePrimeagen/harpoon",
  opts = {
    save_on_toggle = true,
  },
  keys = {
    {
      "<leader>H",
      function()
        require("harpoon.mark").add_file()
      end
    },
    {
      "<leader>J",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end

    }
  }
}
