set DOTFILE_DIR (readlink -f ~/.tomasrc | cut -d / -f 1-5)
set -x NEOVIM_ENV (awk -F "=" '/VIRTUALENV_DIR/ {print $2}' $DOTFILE_DIR/configs/deploy/config.ini | tr -d " " | sed 's@~@'"$HOME"'@')
