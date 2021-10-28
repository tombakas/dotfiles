vim.cmd('source ~/.vimrc')

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- Exit terminal by pressing ESC
vim.api.nvim_set_keymap('t', t'<c-[>', t'<c-\\><c-n>', {silent = true})

-- Moving around terminal mode
vim.api.nvim_set_keymap('t', t'<c-h>', '', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', t'<c-j>', t'<c-\\><c-n><c-w>j', {silent = true})
vim.api.nvim_set_keymap('t', t'<c-k>', t'<c-\\><c-n><c-w>k', {silent = true})
vim.api.nvim_set_keymap('t', t'<c-l>', t'<c-\\><c-n><c-w>l', {silent = true})
--
vim.opt.inccommand = 'split'

-- open terminal on ctrl+t
vim.api.nvim_set_keymap('n', t'<c-t>', t':call OpenTerminal()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
