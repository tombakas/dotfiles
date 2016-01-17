function ubuntu_nvim_install {
if ! sudo grep -qR neovim /etc/apt/
then
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
fi
sudo apt-get -y update
sudo apt-get -y install neovim
sudo pip2 install neovim
}
