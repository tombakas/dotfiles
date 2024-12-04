vim.g.mapleader = " "

-- vim.g.neovim_env = os.getenv("NEOVIM_ENV") or "/Users/ttombakas/.local/share/nvim/base_venv"

vim.g.neovim_env = vim.fn.stdpath('data') .. '/neovim_venv'
vim.g.python3_host_prog = vim.g.neovim_env .. '/bin/python'

function run_command_silently(command)
  local handle = io.popen(command .. " > /dev/null 2>&1")
  handle:close()
end

if vim.fn.isdirectory(vim.g.neovim_env) == 0 then
  os.execute("echo Installing virtual env...")

  run_command_silently("python3 -m venv " .. vim.g.neovim_env)
  run_command_silently(vim.g.neovim_env .. "/bin/pip install pynvim" )
end

require("initialize.lazy")
