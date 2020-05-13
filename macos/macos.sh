#!/usr/bin/env bash

set -e

if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

# Make sure macOS is fully up to date before doing anything
sudo softwareupdate --install --all

# This whole thing kinda hinges on having Homebrew...
# Check for it and install from GitHub if it's not there
# shellcheck disable=SC2230
if test ! "$(which brew)"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all apps from the Brewfile
brew tap homebrew/bundle
brew bundle

# Install Xcode Command Line Tools
sudo xcode-select --install
# Accept Xcode license
sudo xcodebuild -license accept

# Set macOS defaults
# Needs to be last since this will restart everything when done
# shellcheck disable=SC1091
source ./macos/defaults.sh
