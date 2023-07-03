vim.g.mapleader = " "

vim.g.neovim_env = os.getenv("NEOVIM_ENV")
vim.g.python3_host_prog = vim.g.neovim_env .. '/bin/python'

require("initialize.lazy")
