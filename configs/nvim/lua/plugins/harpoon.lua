return {
  "ThePrimeagen/harpoon",
  opts = {
    save_on_toggle = true,
  },
  keys = {
    {
      "<leader>/",
      function()
        require("harpoon.mark").add_file()
      end
    },
    {
      "<leader>.",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end

    }
  }
}
