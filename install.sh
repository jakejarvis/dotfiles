#!/usr/bin/env bash

echo "👋  Deep breaths, everything will (probably) be fine!"

# Ask for the administrator password upfront
sudo -v

# Set up symbolic links for ZSH and Git pointing to this cloned repo
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
mkdir -p ~/.ssh
ln -sf ~/.dotfiles/ssh/.ssh/config ~/.ssh/config

# Suppress terminal login banners
touch ~/.hushlogin

# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390187157
chmod 755 /opt/homebrew/share/zsh
chmod 755 /opt/homebrew/share/zsh/site-functions

# Get Oh My ZSH up and running
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Use Git submodules to get OMZ plugins
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
  # shellcheck disable=SC1091
  source ./macos/macos.sh
else
  echo ""
  echo "This isn't a Mac, so we're all done here!"
  echo "Logout/restart now for the full effects."
  exit 0
fi
