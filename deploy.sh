#!/usr/bin/env bash
set -o errexit
set -o nounset

source ./dotfile_deploy_modules/install_options.sh

GREEN="\e[92m"
YELLOW="\e[93m"
RED="\e[91m"
BLUE="\e[34m"
BOLD="\e[1m"
NORMAL="\e[0m"



SET_UP_NVIM=0
SET_UP_VIM=0
SET_UP_TUMX_CONF=0
SET_UP_BASH_ALIASES=0
YES=0

color_text() {

    color=$(echo $1 | tr [a-z] [A-Z])
    if [[ $2 == "-n" ]]
    then
        flags="-ne"
        shift 2
    else
        flags="-e"
        shift
    fi

    text=${!color}$@$NORMAL
    eval "echo $flags \"$text\""
}

horizontal_rule() {
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

print_help() {
    color_text bold -n "\nVim/Neovim "; echo -e "deployment script\n"
    echo "Run it with one of the following options:"
    echo -e "\t-v\tSet up vim"
    echo -e "\t-n\tSet up neovim"
    echo -e "\t-t\tCreate symlink for tmux.conf"
    echo -e "\t-g\tCreate symlink for .bash_aliases that color git folders"
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

while getopts ":vnhgty" opt; do
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
        t)
            SET_UP_TUMX_CONF=1
            ;;
        g)
            SET_UP_BASH_ALIASES=1
            ;;
        h)
            print_help
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

# OS check
if grep -q Ubuntu /etc/lsb-release; then
    OS=ubuntu
fi

verbose_mkdir() {
    if [ ! -d $1 ]
    then
        echo -e "Creating ${GREEN}$1${NORMAL} directory."
        mkdir -p $1
    else
        echo -e "${YELLOW}$1${NORMAL} already exists."
    fi
}

verbose_ln() {
    if [ ! -e $2 ]
    then
        echo -e "Creating symlink for ${GREEN}$1${NORMAL} at ${GREEN}$2${NORMAL}"
        ln -s $(readlink -f $1) $(readlink -f $2)
    else
        echo -e "Symlink to ${YELLOW}$1${NORMAL} already exists."
    fi
}

# Bash aliases
if [[ $SET_UP_BASH_ALIASES == 1 ]]
then
    horizontal_rule "Setting up bash_aliases"
    verbose_ln .bash_aliases ~/.bash_aliases
fi

# Tmux c
if [[ $SET_UP_TUMX_CONF == 1 ]]
then
    horizontal_rule "Setting up tmux.conf"
    verbose_ln .tmux.conf ~/.tmux.conf
fi

if [ $SET_UP_VIM -eq 1 ] || [ $SET_UP_NVIM -eq 1 ]
then

    MISSING=""
    for missing in make cmake; do
        command -v $missing >/dev/null 2>&1 || MISSING="$missing $MISSING"
    done
    if [ ! -z "$MISSING" ]
    then
        echo -e "The following packages ${RED}need to be installed${NORMAL} to proceed:"
        echo -e "${GREEN}$MISSING${NORMAL}"
        exit
    fi

    horizontal_rule "Setting up vim dotfiles"
    verbose_mkdir ~/.vim/bundle  # Plugin directory
    verbose_mkdir ~/.vim/colors # Color scheme directory
    verbose_mkdir ~/.vim/undo # Undo directory
    verbose_mkdir ~/.vim/indent # Indent file directory

    verbose_ln Mustang.vim ~/.vim/colors/Mustang.vim # Mustang colorscheme 
    verbose_ln htmldjango.vim /home/$(whoami)/.vim/indent/htmldjango.vim # Django template indentation

    # vimrc setup
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
            echo -e "Symlink to ${YELLOW}.vimrc${NORMAL} already exists."
        fi
    fi

fi


# Neovim
if [ "$SET_UP_NVIM" -eq 1 ]
then
    horizontal_rule "Setting up Neovim"
    if ! command -v nvim >/dev/null 2>&1
    then
        case $OS in
            ubuntu)
                ubuntu_nvim_install
                ;;
            centos)
                echo "Can't deal with CentOS"
                ;;
        esac
    else
        echo -e "${RED}neovim already installed${NORMAL}"
        verbose_ln ~/.vim ~/.config/nvim
        verbose_ln init.vim ~/.config/nvim/init.vim 
    fi
fi


# Vim
if [[ $SET_UP_VIM == 1 ]]
then
    horizontal_rule "Setting up Vim"

    VIM_CLONE_DIR=""
    VIM_INSTALL_DIR=""

    if [ -z "$VIM_CLONE_DIR" ]
    then
        VIM_CLONE_DIR="~/Downloads/"
    fi

    if [ -z "$VIM_INSTALL_DIR" ]
    then
        VIM_INSTALL_DIR="~/local/vim/"
    fi

    if [ $YES -ne 1 ]
    then
        echo -e "The default directory to clone ${GREEN}vim${NORMAL} is ${GREEN}$VIM_CLONE_DIR${NORMAL}."
        echo -en "Choose ${YELLOW}y${NORMAL} to continue, ${YELLOW}e${NORMAL} to edit or ${YELLOW}n${NORMAL} to cancel installation. ${RED}[y/e/n]${NORMAL} "

        while true; do
            read -p "" response
            case $response in
                [Yy]* ) break
                    ;;
                [Nn]* ) exit
                    ;;
                [Ee]* ) echo -n "Please enter a new clone path: "
                    read -rp "" VIM_CLONE_DIR; break
                    ;;
                * ) echo "Not a valid option."
                    * ;;
            esac
        done

        # expanding home path
        VIM_CLONE_DIR="${VIM_CLONE_DIR/#\~/$HOME}"

        if [ ! -d "$VIM_CLONE_DIR" ]
        then
            echo -e "Directory ${YELLOW}$VIM_CLONE_DIR${RED} does not exist${NORMAL}. Create directory? ${RED}[y/n]${NORMAL} "
            while true; do
                read -p "" response
                case $response in
                    [Yy]* ) mkdir -pv "$VIM_CLONE_DIR"; break
                        ;;
                    [Nn]* ) exit
                        ;;
                    * ) echo "Not a valid option."
                        * ;;
                esac
            done
        fi

        echo -e "The default directory to install ${GREEN}vim${NORMAL} is ${GREEN}$VIM_INSTALL_DIR${NORMAL}."
        echo -en "Choose ${YELLOW}y${NORMAL} to continue, ${YELLOW}e${NORMAL} to edit or ${YELLOW}n${NORMAL} to cancel installation. ${RED}[y/e/n]${NORMAL} "

        while true; do
            read -p "" response
            case $response in
                [Yy]* ) break
                    ;;
                [Nn]* ) exit
                    ;;
                [Ee]* ) echo -n "Please enter a new clone path: "
                    read -rp "" VIM_INSTALL_DIR break ;; * ) echo "Not a valid option.";; esac done

        # expanding home path
        VIM_INSTALL_DIR="${VIM_INSTALL_DIR/#\~/$HOME}"

        if [ ! -d "$VIM_CLONE_DIR" ]
        then
            echo "Directory ${YELLOW}VIM_CLONE_DIR${NORMAL} does not exist. Create directory? ${RED}[y/n]${NORMAL} "
            while true; do
                read -p "" response
                case $response in
                    [Yy]* ) mkdir -pv "$VIM_INSTALL_DIR"; break
                        ;;
                    [Nn]* ) exit
                        ;;
                    * ) echo "Not a valid option.";;
                esac
            done
        fi
    fi


    case $OS in 
        ubuntu)
            sudo apt-get -y update
            ubuntu_vim_dep_install
            ;;
    esac

    if [ ! -d "${VIM_CLONE_DIR%/}/vim" ];
    then
        echo "${VIM_CLONE_DIR%/}/vim"
        echo -e "Cloning ${GREEN}vim${NORMAL} into ${GREEN}$VIM_CLONE_DIR${NORMAL}."
        pushd $VIM_CLONE_DIR > /dev/null
        git clone https://github.com/vim/vim.git
        popd
    else
        echo -e "${YELLOW}${VIM_CLONE_DIR%/}${NORMAL} already exists. Attempting to pull newest version."
        pushd ${VIM_CLONE_DIR%/}/vim > /dev/null
        git pull
        popd
    fi

    if [ $SET_UP_VIM -eq 1 ]
    then
        case $OS in
            ubuntu)
                compile_vim ${VIM_CLONE_DIR%/}/vim $VIM_INSTALL_DIR
                ;;
            centos)
                echo "Can't deal with CentOS"
                ;;
        esac
    fi

    if [ $SET_UP_NVIM -eq 1 ]
    then
        case $OS in
            ubuntu)
                ubuntu_nvim_install
                ;;
            centos)
                echo "Can't deal with CentOS"
                ;;
        esac
    fi

    # Neobundle setup
    horizontal_rule "Setting up NeoBundle"

    # vimproc
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
    if [ ! -d ~/.vim/bundle/neobundle.vim ]
    then
        echo -e "Cloning ${GREEN}NeoBundle${NORMAL} into ~/.vim/bundle/"
        git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
        ~/.vim/bundle/neobundle.vim/bin/neoinstall
    else
        echo -e "${YELLOW}NeoBundle${NORMAL} already installed."
    fi
    # /Neobundle setup

    # Compile YouCompleteMe
    horizontal_rule "Setting up YouCompleteMe"
    if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so  ]
    then
        ~/.vim/bundle/YouCompleteMe/install.py
    else
        echo -e "${YELLOW}YouCompleteMe${NORMAL} already compiled."
    fi
fi
