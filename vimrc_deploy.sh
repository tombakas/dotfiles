#!/bin/bash
mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/colors/

if [ -f ./Mustang.vim ]
then
    if [ ! -L ~/.vim/colors/Mustang.vim ]
    then
        echo "Creating symlink for Mustang.vim in ~/.vim/colors/"
        ln -s $(pwd)/Mustang.vim /home/$(whoami)/.vim/colors/Mustang.vim
    else
        echo "Symlink for Mustang already exists."
    fi
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]
then
    echo "Cloning neobundle.vim into ~/.vim/bundles/"
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
    echo "Neobundle.vim already exists in ~/.vim/bundles/."
fi
