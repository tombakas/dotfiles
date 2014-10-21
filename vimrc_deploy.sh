#!/bin/bash
mkdir -p ~/.vim/bundle/
mkdir -p ~/.vim/colors/
ln -s Mustang.vim ~/vim/colors/Mustang.vim
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
