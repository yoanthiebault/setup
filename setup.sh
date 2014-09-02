#!/bin/sh
# main setup script for configuring an Ubuntu 14.04 LTS Digital Ocean droplet

USER=$1

# install git
sudo apt-get install -y git

# install unzip
sudo apt-get install -y unzip

# install common software packages
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties
sudo apt-get install -y python
sudo apt-get install -y make
sudo apt-get install -y g++

# install zsh and make it the default shell
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $USER

# install fasd for 'j' jump in zsh
wget -qO- https://codeload.github.com/clvv/fasd/legacy.zip/1.0.1 > fasd.zip
unzip fasd.zip
cd clvv-fasd-4822024
sudo make install
cd
rm -rf clvv-fasd-4822024
rm -f fasd.zip

# install node.js via package manager (npm is included in chris lea's nodejs package)
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get -qq update
sudo apt-get install -y nodejs

# install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# install node version manager to switch versions easily
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.12.1/install.sh | sh

# install jshint and js-beautify
sudo npm install -g jshint
sudo npm install -g js-beautify

# install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# install tmuxinator (help for setting tmux sessions)
sudo apt-get install -y ruby
sudo gem install tmuxinator

# git pull and install dotfiles as well
cd
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/tibotiber/dotfiles.git
cd dotfiles/
git submodule update --init --recursive
cd
ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.tmuxinator .
ln -sf dotfiles/.emacs.d .
