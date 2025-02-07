#!/usr/bin/env bash

set -e

echo "🙏 Deep breaths, everything will (probably) be fine!"
echo ""

# location of the *full repo* (defaults to ~/.dotfiles)
DOTFILES="${DOTFILES:-"$HOME/.dotfiles"}"
# location of this script (should be right next to all the other files, but we handle that next if it's not)
INSTALLER_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# if this is a codespace, link automatically cloned dotfiles repo to the expected DOTFILES
# https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles
if [[ "$CODESPACES" = "true" ]] && [[ -d /workspaces/.codespaces/.persistedshare/dotfiles ]]; then
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles "$DOTFILES"
fi

# clone this repo if this script is all by itself and/or we're not in the expected location
if [[ "$INSTALLER_PATH" != "$DOTFILES" ]] && [[ ! -d "$DOTFILES" ]]; then
  git clone https://github.com/jakejarvis/dotfiles.git "$DOTFILES"

  echo "Successfully cloned the full repo to '$DOTFILES'"
  echo "Run install.sh from that directory to continue. Exiting now..."
  exit 0
fi

# set up symlinks from various default paths to files in this repo
if [[ ! -d ~/.config ]]; then
  mkdir -p ~/.config
fi
if [[ ! -d ~/.ssh ]]; then
  mkdir -p ~/.ssh && chmod 700 ~/.ssh
fi
ln -sf "$DOTFILES/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES/zsh/.zprofile" ~/.zprofile
ln -sf "$DOTFILES/bash/.bash_profile" ~/.bash_profile
ln -sf "$DOTFILES/ssh/.ssh/config" ~/.ssh/config
ln -sf "$DOTFILES/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES/git/.gitignore_global" ~/.gitignore
ln -sf "$DOTFILES/starship/config.toml" ~/.config/starship.toml

# this file will be sourced by .zshrc for more sensitive variables/settings
touch ~/.zshrc.local

# prepare zinit manually
ZINIT_HOME="${ZINIT_HOME:-"${XDG_DATA_HOME:-"${HOME}/.local/share"}/zinit/zinit.git"}"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# the remainder of the setup tasks are OS-specific
if [[ "$OSTYPE" = darwin* ]]; then
  # final symlinks
  ln -sf "$DOTFILES/nano/brew.nanorc" ~/.nanorc
  ln -sf "$DOTFILES/Brewfile" ~/Brewfile

  # suppress terminal login banners
  touch ~/.hushlogin

  # disable bash session restoration
  touch ~/.bash_sessions_disable

  source "$DOTFILES/macos/macos.sh"
elif [[ "$OSTYPE" = linux-gnu* ]]; then
  # final symlinks
  ln -sf "$DOTFILES/nano/default.nanorc" ~/.nanorc

  source "$DOTFILES/linux/linux.sh"
else
  echo "I don't recognize this OS... skipping extra steps."
fi

# wow
echo ""
echo "🤯 It actually worked!"
echo "Log out and log back in (or just restart) to finish installing all ZSH features."
