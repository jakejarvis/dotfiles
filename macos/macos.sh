#!/usr/bin/env bash

set -euo pipefail

# This shouldn't be run if not on macOS, but make double sure
if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Make sure macOS is fully up to date before doing anything
sudo softwareupdate --install --all

# Install Rosetta 2
sudo softwareupdate --install-rosetta --agree-to-license

# Install Xcode Command Line Tools
sudo xcode-select --install
# Accept Xcode license
sudo xcodebuild -license accept

# This whole thing kinda hinges on having Homebrew...
# Check for it and install from GitHub if it's not there
# shellcheck disable=SC2230
if test ! "$(which brew)"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# fix zplug
ln -s "$(brew --prefix)/opt/zplug" ~/.zplug

# Disable analytics
# https://docs.brew.sh/Analytics
brew analytics off

# Update Homebrew recipes
brew update

# Install more current ZSH and set as default shell
# https://stackoverflow.com/a/44549662/1438024
brew install zsh
sudo sh -c "echo $(brew --prefix)/bin/zsh >> /etc/shells"
chsh -s "$(brew --prefix)/bin/zsh"

# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390187157
chmod 755 "$(brew --prefix)/share/zsh"
chmod 755 "$(brew --prefix)/share/zsh/site-functions"

# Install all apps from the Brewfile, ignore errors
brew tap homebrew/bundle
brew bundle || true

# Set macOS defaults
# Needs to be last since this will restart everything when done
# shellcheck disable=SC1091
source ./macos/defaults.sh
