#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS EC2 instance
# for headless setup. 

# Correct locale setting (since .bash_profile not used yet for this session)
export LANGUAGE=en_US:en
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales

# Install git
sudo apt-get install -y git

# Install node.js via package manager (npm is included in chris lea's nodejs package)
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get -qq update
sudo apt-get install -y nodejs

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install tmuxinator (help for setting tmux sessions)
sudo gem install tmuxinator

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/tibotiber/ec2-dotfiles.git dotfiles
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.tmuxinator .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

# update bash profile
. ~/.bash_profile

# source completion file for tmuxinator
source .tmuxinator/tmuxinator.bash

# Install sails.js MVC framework for node.js
sudo npm -g install sails

# Install MQTT tools
sudo apt-get install -y mosquitto python-mosquitto mosquitto-clients
sudo rm /etc/init/mosquitto.conf # because I don't want mosquitto as a startup service
sudo npm -g install mosca # mosca installed globally if not included in ubismart

# config for efficient git
git config --global user.name "Thibaut Tiberghien"
git config --global user.email "thibaut.tiberghien@ipal.cnrs.fr"
ssh-keygen -t rsa -N "" -C "thibaut@planecq.com" -f ~/.ssh/id_rsa
ssh-add id_rsa
echo "You should copy the next line into a new ssh key on github (https://github.com/settings/ssh)."
cat ~/.ssh/id_rsa.pub
echo "Then you can run 'ssh -T git@github.com' to check that the connection is working."
