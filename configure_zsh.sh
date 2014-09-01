#!/bin/zsh
# zsh config and dotfiles
setopt EXTENDED_GLOB
ln -s ~/dotfiles/.zprezto/ ~/
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    rm -f "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# start zsh ssh agent
exec ssh-agent zsh

# config for efficient git
git config --global user.name "Thibaut Tiberghien"
git config --global user.email "thibaut.tiberghien@ipal.cnrs.fr"
ssh-keygen -t rsa -N "" -C "thibaut@planecq.com" -f ~/.ssh/id_rsa
ssh-add .ssh/id_rsa
echo "You should copy the next line into a new ssh key on github  https://github.com/settings/ssh)."
cat ~/.ssh/id_rsa.pub
echo "Then you can run 'ssh -T git@github.com' to check that the connection is working."
