#!/bin/bash
set -o errexit
set -o nounset

GREEN="\e[92m"
YELLOW="\e[93m"
RED="\e[91m"
BLUE="\e[34m"
BOLD="\e[1m"
NORMAL="\e[0m"

SET_UP_NVIM=0
SET_UP_VIM=0

function color_text {

color=$1
if [[ $2 == "-n" ]]
then
    flags="-ne"
    shift 2
else
    flags="-e"
    shift
fi

case $color in
    green)
        text="$GREEN$@$NORMAL"
        ;;
    red)
        text="$RED$@$NORMAL"
        ;;
    blue)
        text="$BLUE$@$NORMAL"
        ;;
    yellow)
        text="$YELLOW$@$NORMAL"
        ;;
    bold)
        text="$BOLD$@$NORMAL"
        ;;
esac
eval "echo $flags \"$text\""
}

function horizontal_rule {
rule_length=80
rule=$(eval printf '%0.1s' "-"{1..$rule_length})

front_length=$(echo $rule_length/2-${#1}/2 | bc)
front=$(eval printf '%0.1s' "-"{1..$front_length})
back_length=$(echo $rule_length/2-${#1}+${#1}/2 |bc )
back=$(eval printf '%0.1s' "-"{1..$back_length})

if [ -z "$1" ]
then
    echo -e "\n$rule"
else
    echo -e "\n$rule"
    echo -n $front
    color_text green -n $@
    echo $back
    echo $rule

fi
}

function print_help {
color_text bold -n "\nVim/Neovim "; echo -e "deployment script\n"
echo "Run it with one of the following options:"
echo -e "\t-v\tSet up vim"
echo -e "\t-n\tSet up neovim"
echo -e "\t-y\tAssume -y for all prompts"
echo -e "\t-h\tThis help message"
echo
}

# If no arguments provided, print help
if [ $# == 0 ]
then
    print_help
    exit 0
fi

while getopts ":vnh" opt; do
    case $opt in
        v)
            SET_UP_VIM=1
            ;;
        n)
            SET_UP_NVIM=1
            ;;
        y)
            YES=1
            ;;
        h)
            print_help
            ;;
        ?)
            helptext
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

if [[ $SET_UP_VIM == 1 ]]
then
    horizontal_rule "Setting up Vim"
fi
horizontal_rule "Setting up vim dotfiles"

# .vim directory creation function
function verbose_mkdir {
if [ ! -d $1 ]
then
    echo -e "Creating ${GREEN}$1${NORMAL} directory."
    mkdir -p $1
else
    echo -e "${YELLOW}$1${NORMAL} already exists."
fi
}

function verbose_ln {
    if [ ! -e $2 ]
    then
        echo -e "Creating symlink for ${GREEN}$1${NORMAL} at ${GREEN}$2${NORMAL}"
        ln -s $(readlink -f $1) $(readlink -f $2)
    else
        echo -e "${YELLOW}$1${NORMAL} already exists."
    fi
}

verbose_mkdir ~/.vim/bundle  # Plugin directory
verbose_mkdir ~/.vim/colors # Color scheme directory
verbose_mkdir ~/.vim/undo # Undo directory
verbose_mkdir ~/.vim/indent # Indent file directory

verbose_ln Mustang.vim ~/.vim/colors/Mustang.vim # Mustang colorscheme 
verbose_ln htmldjango.vim /home/$(whoami)/.vim/indent/htmldjango.vim # Django template indentation

if [ ! -d ~/.vim/bundle/vimproc.vim ]
then
    echo -e "Cloning ${GREEN}vimproc${NORMAL} into ~/.vim/bundle/"
    git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
    pushd ~/.vim/bundle/vimproc.vim
    make
    popd
else
    echo -e "${YELLOW}vimproc${NORMAL} already installed."
fi

# Neobundle setup
if [ ! -d ~/.vim/bundle/neobundle.vim ]
then
    echo -e "Cloning ${GREEN}NeoBundle${NORMAL} into ~/.vim/bundle/"
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    ~/.vim/bundle/neobundle.vim/bin/neoinstall
else
    echo -e "${YELLOW}NeoBundle${NORMAL} already installed."
fi

if [ ! -f ~/.vimrc ]
then
    ln -s $(pwd)/.vimrc ~/.vimrc
else
    if [ ! -e $(readlink -f ~/.vimrc) ] || ! cmp -s $(pwd)/.vimrc ~/.vimrc
    then
        echo -en "${YELLOW}.vimrc${NORMAL} already exists. Replace with new version? (This will create a backup copy of present .vimrc) ${RED}[y/n]${NORMAL} "
        read -r -p "" response
        if [[ $response =~ ^([yY][eE][sS]|[yY])$  ]]
        then
            echo "Backing up to ~.vimrc.$(date +"%H%M%S").bak"
            mv ~/.vimrc{,.$(date +"%H%M%S").bak}
            ln -s $(pwd)/.vimrc ~/.vimrc
            echo "Symlink created."
        else
            echo ".vimrc unchanged."
        fi
    else
        echo -e "${YELLOW}.vimrc${NORMAL} symlink to dotfiles already exists"
    fi
fi

if [ "$SET_UP_NVIM" -eq 1 ]
then
    horizontal_rule "Setting up Neovim"
    if ! command -v nvim >/dev/null 2>&1
    then
        if grep -qR neovim /etc/apt/
        then
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
        fi
        sudo apt-get -y update
        sudo apt-get -y install neovim
        sudo pip2 install neovim
    else
        echo -e "${RED}neovim already installed${NORMAL}"
        verbose_ln ~/.vim ~/.config/nvim
        verbose_ln init.vim ~/.config/nvim/init.vim 
    fi
fi

# Compile YouCompleteMe
horizontal_rule YouCompleteMe
if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so  ]
then
    ~/.vim/bundle/YouCompleteMe/install.py
else
    echo -e "${YELLOW}YouCompleteMe already compiled."
fi
