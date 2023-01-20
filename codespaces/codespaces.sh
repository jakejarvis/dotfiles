#!/usr/bin/env bash

set -e

# link automatically cloned dotfiles repo to regular ~/.dotfiles path
# https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles
ln -sf /workspaces/.codespaces/.persistedshare/dotfiles ~/.dotfiles

# clean up
sudo rm -rf /var/lib/apt/lists/*

# extra ubuntu packages
if [[ "$(sudo find /var/lib/apt/lists/* | wc -l)" = "0" ]]; then
  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    man \
    curl \
    wget \
    lsb-release \
    ca-certificates \
    file \
    shared-mime-info
fi

# prepare zinit manually
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
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

# set shell to zsh
sudo chsh -s /bin/zsh "$(whoami)"

# clean up
sudo rm -rf /var/lib/apt/lists/*
