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
sudo timedatectl set-timezone America/New_York || true

# install linuxbrew:
# https://docs.brew.sh/Homebrew-on-Linux#install
if ! command -v brew &>/dev/null; then
  # TODO: currently tricking installer into thinking we're running it as a non-root user, it doesn't _really_ matter in
  # my use cases (e.g. codespaces) but this is apparently very unsafe.
  # https://github.com/Homebrew/install/blob/master/install.sh#L302
  NONINTERACTIVE=1 UID=999 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install tailscale
if ! command -v tailscale &>/dev/null; then
  curl -fsSL https://tailscale.com/install.sh | bash
fi

# install fnm
if ! command -v fnm &>/dev/null; then
  curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
fi

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
