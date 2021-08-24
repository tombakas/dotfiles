lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pylsp.setup{
    cmd = {"/home/tomas/local/neovim_envs/neovim3/bin/pylsp"};
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120;
                };
            };
        };
    };
}
EOF
