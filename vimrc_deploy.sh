#!/bin/bash

# Bundle directory creation
if [ ! -d ~/.vim/bundle ]
then
    echo "Creating ~/.vim/bundle directory."
    mkdir -p ~/.vim/bundle
fi

# Color scheme directory
if [ ! -d ~/.vim/colors ]
then
    echo "Creating ~/.vim/colors directory."
    mkdir -p ~/.vim/colors
fi

# Undo directory
if [[ ! -d ~/.vim/undo ]]; then
    echo "Creating ~/.vim/undo directory."
    mkdir ~/.vim/undo
fi


# Mustang colorscheme symlink creation
if [ -f ./Mustang.vim ]
then
    if [ ! -f ~/.vim/colors/Mustang.vim ]
    then
        ln -s `pwd`/Mustang.vim /home/$(whoami)/.vim/colors/Mustang.vim
    else
        echo "Mustang.vim already exists."
    fi
fi

# Neobundle setup
if [ ! -d ~/.vim/bundle/neobundle.vim ]
then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
    echo "NeoBundle already installed."
fi

if [ ! -f ~/.vimrc ]
then
    ln -s $(pwd)/.vimrc ~/.vimrc
else
    if [[ $(readlink -f ./.vimrc) != $(readlink -f ~/.vimrc) ]]
    then
        read -r -p ".vimrc already exists. Replace with new version?(This will create a backup copy of present .vimrc) [y/n] " response
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
        echo ".vimrc symlink to dotfiles already exists"
    fi
fi
