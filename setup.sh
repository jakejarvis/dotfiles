#!/usr/bin/env bash

if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

echo "👋  Deep breaths, everything will (probably) be fine!"

# This whole thing kinda hinges on having Homebrew...
# Check for it and install from GitHub if it's not there
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all apps from the Brewfile
brew tap homebrew/bundle
brew bundle

# Install Xcode Command Line Tools
xcode-select --install

# Get Oh My ZSH up and running
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Set up symbolic links for ZSH and Git pointing to this cloned repo
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global

# Set macOS defaults
# Needs to be last since this will restart everything when done
source ./macos/defaults.sh
