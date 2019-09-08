#!/usr/bin/env bash


#############################################################
###     Try using the Brewfile one folder up instead!     ###
###        brew tap homebrew/bundle && brew bundle        ###
#############################################################


# WARNING: I have not tested this yet (nor needed to, thankfully) so this is
# basically just a list of everything I've installed with Homebrew. :)


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap casks. (Just for Android SDK here, otherwise not a fan of using casks!)
brew tap caskroom/cask

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


# Perhaps most importantly...
brew install zsh

# Better bash as a backup.
brew install bash
brew install bash-completion

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed   # --with-default-names

# Install `wget` with IRI support.
brew install wget   # --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim   # --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install other universally useful binaries.
brew install ack
#brew install exiv2
brew install gs
brew install imagemagick   # --with-webp
brew install ffmpeg   # --with-libvpx
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install the_silver_searcher

# Git
brew install git
brew install git-lfs
brew install git-crypt

# Node & NPM / NVM
brew install node
brew install nvm

# mtr (better ping & traceroute)
brew install mtr
# Allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/jake/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr


# ---------- My Fringe Needs ----------

brew install amazon-ecs-cli
brew tap aws/tap && brew install aws-sam-cli
brew install aws-shell
brew install angular-cli
brew install asciinema
brew install azure-cli
brew install caddy
brew install carthage
brew install cli53
brew install cloudflare/cloudflare/cloudflared
brew install cocoapods
brew install composer
brew install dnsmasq
brew install doctl
brew install elixir
brew install erlang
brew tap facebook/fb && brew install fbsimctl
brew install geoip
brew install gitlab-runner
brew install go
brew install govendor
brew tap heroku/brew && brew install heroku
brew install heroku-node
brew tap hhvm/hhvm && brew install hhvm
brew install htop
brew install httrack
brew install hub
brew install hugo
brew install hydra
brew install iproute2mac
brew install jq
brew install kubernetes-cli
brew install kubernetes-helm
brew install mcrypt
brew install mhash
brew install mkcert
# brew install mongodb
brew tap mongodb/brew && brew install mongodb-community
brew install mosh
brew install mysql
brew install mysql-client
brew install ncurses
brew install neofetch
brew install netcat
brew install openvpn
brew install optipng
brew install packer
brew tap thoughtbot/formulae && brew install parity
brew install php        # = php@7.3   https://formulae.brew.sh/formula/php
brew install php@7.1
brew install php@7.2
# brew tap exolnet/homebrew-deprecated && brew install php@5.6
# brew tap exolnet/homebrew-deprecated && brew install php@7.0
brew install pngcheck
brew install pngcrush
brew install postgresql
brew install python
brew install python@2
brew install qt
brew install ruby
brew install ruby-build
brew install rbenv
brew install rclone
brew install s3fs
brew install serverless
brew install speedtest-cli
brew install sqlite
brew install sub2srt
brew install terraform
brew install the_silver_searcher
brew install tidy-html5
brew install tor
brew install torsocks
brew install travis
brew install typescript
brew install unrar
brew install watchman
brew install whois
brew install wireguard-tools
brew install wireguard-go
brew install wp-cli
brew tap wpengine/wpe-cli && brew install wpe-cli
brew install xz
brew install yarn
brew install youtube-dl
brew install yuicompressor

# Android SDK
brew install ant
brew install maven
brew install gradle
brew cask install android-sdk

# Pentesting tools
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pdfcrack
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install xpdf
brew install bettercap
brew install hashcat
brew install nikto
brew install tcpdump

# -------------------------------------



# Remove outdated versions from the cellar.
brew cleanup

# Call the doctor after this mess just to be safe.
brew doctor
