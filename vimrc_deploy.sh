#!/bin/bash
mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/colors/
if [ -f ./Mustang.vim ]
then
    ln -s `pwd`/Mustang.vim /home/$(whoami)/.vim/colors/Mustang.vim
fi

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
