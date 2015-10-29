#!/bin/bash

if [ ! -d ~/.vim/bundle ]
then
    echo "Creating ~/.vim/bundle directory"
    mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/colors ]
then
    echo "Creating ~/.vim/colors directory"
    mkdir -p ~/.vim/colors
fi

if [ -f ./Mustang.vim ]
then
    if [ ! -f ~/.vim/colors/Mustang.vim ]
    then
        ln -s `pwd`/Mustang.vim /home/$(whoami)/.vim/colors/Mustang.vim
    else
        echo "Mustang.vim already exists."
    fi
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]
then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
else
    echo "NeoBundle already installed."
fi
