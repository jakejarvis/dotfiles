#!/bin/bash


#############################################################
###     Try using the Brewfile one folder up instead!     ###
###        brew tap homebrew/bundle && brew bundle        ###
#############################################################


# I'm not a huge fan of using Casks, but keeping a list here in case I change 
# my mind when I'm staring at a default macOS install and freaking out...

# To update all:
#   brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup


# System Utilities

brew cask install osxfuse
brew cask install appzapper
brew cask install backblaze
brew cask install backblaze-downloader
brew cask install carbon-copy-cloner
brew cask install cleanmymac
brew cask install coconutbattery
brew cask install daisydisk
brew cask install duet
brew cask install endurance
brew cask install etrecheckpro
brew cask install filebot
brew cask install geekbench
brew cask install intel-power-gadget
brew cask install paragon-ntfs
brew cask install the-unarchiver
brew cask install transmission
brew cask install unetbootin
brew cask install vnc-viewer


# Passwords, VPNs, other Security

brew cask install 1password
brew cask install authy
# brew cask install gpg-suite-no-mail     # Install separately: https://github.com/GpgMailNoActivation/GpgMailNoActivation
brew tap jakejarvis/brew && brew install jakejarvis/brew/gpg-suite-no-drm
brew cask install keybase
brew cask install little-snitch
brew cask install nordvpn
brew cask install tor-browser
brew cask install tunnelblick


# Development

brew cask install eclipse-java
brew cask install filezilla
brew cask install github
brew cask install glyphs
brew cask install imageoptim
brew cask install intellij-idea
brew cask install iterm2
brew cask install postman
brew cask install robo-3t
brew cask install sequel-pro
brew cask install transmit
brew cask install visual-studio-code
brew cask install visual-studio


# Virtual Machines (& Docker)

brew cask install docker
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vagrant
brew cask install vmware-fusion


# Media

brew cask install beamer
brew cask install handbrake
brew cask install iina
brew cask install plex-media-player
brew cask install pocket-casts
brew cask install spotify
brew cask install vlc


# Communication/Social

brew cask install discord
brew cask install skype
brew cask install slack
brew cask install whatsapp
brew cask install zoomus


# Gaming

brew cask install steam
brew cask install nvidia-geforce-now


# Pentesting

brew cask install burp-suite
brew cask install charles
brew cask install wifi-explorer
brew cask install wireshark


# Browsers (for reference only -- install these via offline DMGs no matter what)

# * Firefox
#    - Stable
#    - Dev: https://www.mozilla.org/en-US/firefox/developer/
#    - Nightly: https://www.mozilla.org/en-US/firefox/channel/desktop/

# * Chrome
#    - Stable
#    - Canary: https://www.google.com/chrome/canary/

# * Safari
#    - Preview: https://developer.apple.com/safari/technology-preview/
