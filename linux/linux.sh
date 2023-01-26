#!/usr/bin/env bash

set -e

if [[ -e /etc/debian_version ]]; then
  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    zsh \
    zsh-common \
    zsh-doc \
    man \
    curl \
    wget \
    gnupg \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    tzdata \
    shared-mime-info \
    build-essential \
    file \
    procps \
    git

  sudo apt-get clean -y
fi

# set machine's timezone to local time
sudo timedatectl set-timezone America/New_York

# install linuxbrew:
# https://docs.brew.sh/Homebrew-on-Linux#install
if ! command -v brew &>/dev/null; then
  # TODO: hack to permit installing as root, find a better way
  # https://github.com/Homebrew/install/blob/master/install.sh#L306
  sudo touch /.dockerenv
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
  sudo rm /.dockerenv
fi

# install tailscale
if ! command -v tailscale &>/dev/null; then
  curl -fsSL https://tailscale.com/install.sh | bash
fi

# install volta
if ! command -v volta &>/dev/null; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
  curl -fsSL https://get.volta.sh | bash -s -- --skip-setup
fi
volta install node@lts npm@latest yarn@latest

# install rbenv & ruby-build
if ! command -v rbenv &>/dev/null; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
fi

# install pyenv
if ! command -v pyenv &>/dev/null; then
  curl -fsSL https://github.com/pyenv/pyenv-installer/raw/HEAD/bin/pyenv-installer | bash
fi

# set login shell to zsh
sudo chsh -s "$(which zsh)" "$(whoami)"
