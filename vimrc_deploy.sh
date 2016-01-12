#!/bin/bash

# .vim directory creation function
function mkvimdir {
if [ ! -d ~/.vim/$1 ]
then
    echo "Creating ~/.vim/$1 directory."
    mkdir -p ~/.vim/$1
fi
}

# Bundle directory creation
mkvimdir bundle

# Color scheme directory
mkvimdir colors

# Undo directory
mkvimdir undo

# Indent directory
mkvimdir indent

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

# djangohtml indentation
if [ ! -e ~/.vim/indent/htmldjango.vim ]
then
    echo "Copying djangohtml.vim to ~/.vim/indent/"
    ln -s $(pwd)/htmldjango.vim /home/$(whoami)/.vim/indent/
else
    echo "htmldjango.vim already exists."
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
