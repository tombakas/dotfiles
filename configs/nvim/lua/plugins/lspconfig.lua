return {
  'neovim/nvim-lspconfig',

  config = function()
    local keymap = vim.keymap.set

    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.pylsp.setup{
      cmd = { vim.g.neovim_env .. "/bin/pylsp" };
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              maxLineLength = 120;
              ignore = { 'E203', 'W503' };
              enabled = true;
            };
            pyflakes = {
              enabled = false;
            },
            flake8 = {
              maxLineLength = 120;
              enabled = true
            };
            jedi = {
              enabled = true;
            }
          };
        };
      };
    }

    keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.references()<CR>')
    keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  end
}
