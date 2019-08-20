" Reload on save
autocmd BufWritePost * silent !$DOTFILE_DIR/jw/reload.py %:p
