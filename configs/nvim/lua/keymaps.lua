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

-- Clear highlights
keymap("n", "<leader>,", "<cmd>nohlsearch<cr>", opts)

-- Search for highlighted string
keymap("v", "//", 'y/<c-r>"<cr>')

-- Go to begginning/end of line in insert mode
keymap("i", "<C-a>", "<C-o>^")
keymap("i", "<C-e>", "<C-o>$")

-- control-l deletes right character in insert mode
keymap("i", "<c-l>", "<del>")

keymap("n", "<leader>jq", ':%!jq "."<cr>')
keymap("v", "<leader>jq", ":'<,'>!jq<cr>")

-- Map % to Tab
keymap("n", "<tab>", "%")
keymap("v", "<tab>", "%")
keymap("n", "<c-m>", "<plug>(matchup-%)")
keymap("n", "<c-i>", "<c-i>")

keymap("i", "<s-tab>", "<c-d>")

-- Zoom in/out of a window
keymap("n", "<leader>z", "<cmd>lua ZoomToggle()<cr>")

-- Exit terminal by pressing ESC
keymap("t", "<c-t>", "<c-\\><c-n>")

-- Moving around terminal mode
keymap("t", "<c-h>", "<c-\\><c-n><c-w>h")
keymap("t", "<c-j>", "<c-\\><c-n><c-w>j")
keymap("t", "<c-k>", "<c-\\><c-n><c-w>k")
keymap("t", "<c-l>", "<c-\\><c-n><c-w>l")

-- open terminal on ctrl+t
keymap("n", "<c-t>", "<cmd>terminal<cr>", { noremap = true, silent = true })

keymap("i", "<c-s-l>", "<cmd>lua EscapePair()<cr>")

-- delete all buffers except current one
keymap("n", "<leader>bo", "<cmd>%bd|e#|bd#<cr>")

-- Launching plugins
keymap("n", "<leader>l", "<cmd>Lazy<cr>")
keymap("n", "<leader>m", "<cmd>Mason<cr>")

-- Switch to insert mode after deleting a charecter in select mode
keymap("s", "<c-l>", "<bs>i")
keymap("s", "<bs>", "<bs>i")

-- New mapping for opening the manual for keyword under cursor, as Neovim 0.10
-- replaces the K mapping with the lsp hover function
keymap("n", "gk", "K")

-- LSP
keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end)
keymap("n", "<leader>fr", function() vim.lsp.buf.references() end)
keymap('n', 'gd', function() vim.lsp.buf.definition() end)

-- Diagnostics
keymap("n", "]d", function()
  vim.diagnostic.goto_next()
end)
keymap("n", "[d", function()
  vim.diagnostic.goto_prev()
end)
