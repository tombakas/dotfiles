lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pylsp.setup{
    cmd = {"/home/tomas/local/neovim_envs/neovim3/bin/pylsp"};
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120;
                    ignore = { 'E203', 'W503' };
                };
            };
        };
    };
}

vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
EOF
