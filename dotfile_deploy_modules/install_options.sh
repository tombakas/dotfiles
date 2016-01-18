function ubuntu_nvim_install {
if ! sudo grep -qR neovim /etc/apt/
then
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
fi
sudo apt-get -y update
sudo apt-get -y install neovim
sudo pip2 install neovim
}

function ubuntu_vim_dep_install {
horizontal_rule "Installing vim dependencies"
sudo apt-get -y update
sudo apt-get install libperl-dev python-dev ruby-dev ncurses-dev
}

function compile_vim {
horizontal_rule "Compiling vim"
pushd $1 > /dev/null
./configure --prefix=$2 --enable-multibyte --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --with-features=huge 
cores=$(grep -c ^processor /proc/cpuinfo)
make -j $cores
popd
}
