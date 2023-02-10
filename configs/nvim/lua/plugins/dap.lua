return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
  },

  config = function()

    require("dap-python").setup("python", {})
    require("dapui").setup()
  end,

  keys = {
    {'<F5>', function() require('dap').continue() end },
    {'<F10>', function() require('dap').step_over() end },
    {'<F11>', function() require('dap').step_into() end },
    {'<F12>', function() require('dap').step_out() end },
    { "<leader>bp" , function() require 'dap'.toggle_breakpoint() end },
    { "<leader>d", function() require("dapui").toggle() end, mode = { "n" } }
  }
}
