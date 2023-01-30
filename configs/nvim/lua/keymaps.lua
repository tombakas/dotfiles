-- Shorten function name
local keymap = vim.keymap.set

-- Silent keymap option
local opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Easier moving up/down on a wrapped line
keymap("n", "j", "gj")
keymap("n", "k", "gk")

--- Git blame
keymap("n", "gb", "<cmd>Git blame<cr>")

-- Clear highlights
keymap("n", "<leader><space>", "<cmd>nohlsearch<CR>", opts)

-- Search for highlighted string
keymap("v", "//", "y/<c-r>\"<cr>")

-- Exit insert mode by hitting jj
keymap("i", "jj", "<esc>")

-- Go to begginning/end of line in insert mode
keymap("i", "<C-a>", "<C-o>^")
keymap("i", "<C-e>", "<C-o>$")

-- control-l deletes right character in insert mode
keymap("i", "<c-l>", "<del>")

keymap("n", "<leader>jq", ":%!jq \".\"<cr>")

-- Map % to Tab
keymap("n", "<tab>", "%")
keymap("v", "<tab>", "%")
keymap("n", "<c-m>", "<plug>(matchup-%)")
keymap("n", "<c-i>", "<c-i>")

-- Zoom in/out of a window
keymap("n", "<leader>z", "<cmd>lua ZoomToggle()<cr>")

-- Exit terminal by pressing ESC
keymap('t', '<esc>', '<c-\\><c-n>')

-- Moving around terminal mode
keymap('t', '<c-h>', '<c-\\><c-n><c-w>h')
keymap('t', '<c-j>', '<c-\\><c-n><c-w>j')
keymap('t', '<c-k>', '<c-\\><c-n><c-w>k')
keymap('t', '<c-l>', '<c-\\><c-n><c-w>l')

-- open terminal on ctrl+t
keymap('n', '<c-t>', '<cmd>terminal<cr>i', {noremap = true, silent = true})

keymap('i', '<m-l>', '<cmd>lua EscapePair()<CR>')
