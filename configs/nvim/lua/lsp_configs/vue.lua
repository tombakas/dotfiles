vim.lsp.config["vue_ls"] = {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
}

local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vtsls_config = {
  settings = {
    vtsls = {
			tsserver = {
				globalPlugins = {
					{
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
						languages = { "vue" },
						location = vue_language_server_path,
						name = "@vue/typescript-plugin",
					},
				},
			},
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

-- nvim 0.11 or above
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.enable({'vtsls', 'vue_ls'})
