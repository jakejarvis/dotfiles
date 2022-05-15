#!/usr/bin/env bash

USERNAME=$(whoami)

sudo apt-get update
sudo apt-get -y install man

# set shell to zsh
sudo chsh -s /usr/bin/zsh "$USERNAME"

# re-find bearings
ln -sf "$YOU_ARE_HERE" ~/.dotfiles

# install zplug
export ZPLUG_HOME=~/.zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
git clone https://github.com/zplug/zplug $ZPLUG_HOME
