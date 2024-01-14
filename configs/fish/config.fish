if status is-interactive
    set -U fish_greeting

    zoxide init fish | source
    starship init fish | source
end

alias vim="nvim"
alias zlj="zellij"
alias tmux="zellij"
alias gs="git status"
alias gl="git log"
alias zb="cd (get_repo_root.sh)"
alias gco="git checkout"
