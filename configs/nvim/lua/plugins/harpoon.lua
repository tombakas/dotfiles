return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,

  opts = {
    save_on_toggle = false,
    save_on_menu_quit = false,
  },

  keys = function()
    local harpoon = require("harpoon")

    -- picker
    local function generate_harpoon_picker()
      local file_paths = {}
      for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, {
          text = item.value,
          file = item.value,
        })
      end
      return file_paths
    end

    return {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon add",
      },

      {
        "<leader>hq",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon quick menu",
      },

      {
        "<leader>h1",
        function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon select 1",
      },
      {
        "<leader>h2",
        function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon select 2",
      },
      {
        "<leader>h3",
        function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon select 3",
      },
      {
        "<leader>h4",
        function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon select 4",
      },

      -- Toggle previous & next buffers stored within Harpoon list
      {
        "<leader>hp",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon prev",
      },
      {
        "<leader>hn",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon next",
      },
      {
        "<leader>hl",
        function()
          Snacks.picker({
            finder = generate_harpoon_picker,
          })
        end,
        desc = "Harpoon list",
      },
    }
  end,

  config = function()
    require("harpoon").setup()
  end,
}
