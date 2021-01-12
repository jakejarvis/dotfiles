#!/usr/bin/env bash

# This shouldn't be run if not on macOS, but make double sure
if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

# Make sure macOS is fully up to date before doing anything
sudo softwareupdate --install --all

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

# Disable analytics
# https://docs.brew.sh/Analytics
brew analytics off

# Update Homebrew recipes
brew update

# Install all apps from the Brewfile
brew tap homebrew/bundle
brew bundle

# Set macOS defaults
# Needs to be last since this will restart everything when done
# shellcheck disable=SC1091
source ./defaults.sh
