nnoremap <leader>t <cmd>lua require('telescope.builtin').find_files({hidden=true,find_command={"fd", "--type", "f", "--exclude", ".git"}})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>be <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').filetypes()<cr>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>rs <cmd>lua require('telescope.builtin').resume()<cr>
nnoremap <leader>fq <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <leader>f: <cmd>lua require('telescope.builtin').commands()<cr>
inoremap <M-u> <cmd>Telescope ultisnips<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap "" <cmd>lua require('telescope.builtin').registers()<cr>
inoremap <C-r> <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <Up> <cmd>lua require('telescope.builtin').oldfiles()<cr>

nunmap ,ts

lua << EOF
require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-S-u>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-u>"] = false
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    file_browser = {
      dir_icon = '🖿',
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')
require("telescope").load_extension("file_browser")

vim.api.nvim_set_keymap(
  "n",
  "-",
  ":Telescope file_browser<cr>",
  { noremap = true }
)
EOF
