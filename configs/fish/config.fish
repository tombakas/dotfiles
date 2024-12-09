set -x DOTFILE_DIR (dirname (dirname (dirname (status -f))))
source $DOTFILE_DIR/configs/bash/shell_env

function initialize_hooks
  if type -q zoxide
    zoxide init fish | source
  end

  if type -q starship
   starship init fish | source
  end

  if type -q direnv
    direnv hook fish | source
  end
end

if status is-interactive
    set -U fish_greeting

    initialize_hooks
end
