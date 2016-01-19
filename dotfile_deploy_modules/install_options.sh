ubuntu_nvim_install() {
    if ! sudo grep -qR neovim /etc/apt/
        then
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
        fi
    sudo apt-get -y install neovim
    sudo pip2 install neovim
}

ubuntu_vim_dep_install() {
    horizontal_rule "Installing vim dependencies"
    sudo apt-get -y install libperl-dev python-dev ruby-dev ncurses-dev python-flake8 python3-flake8 python-dev python3-dev python-jedi python3-jedi 
}

centos_vim_dep_install() {
    horizontal_rule "Installing vim dependencies"
    sudo yum -y install perl-devel ruby-devel python-devel ncurses-devel
    sudo yum -y groupinstall 'Development Tools'
    sudo yum -y install python-setuptools
    sudo easy_install pip
    sudo pip2 install jedi pep8 flake8 
}

compile_vim() {
    horizontal_rule "Compiling vim"
    pushd $1 > /dev/null
    echo ./configure --prefix=$2 --enable-multibyte --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --with-features=huge 
    cores=$(grep -c ^processor /proc/cpuinfo)
    echo $cores
    # make -j $cores
    popd
}
