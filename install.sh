#!/usr/bin/env bash

set -euo pipefail

echo "🙏 Deep breaths, everything will (probably) be fine!"
echo ""

# location of the *full repo* (defaults to ~/.dotfiles)
DOTFILES_PATH="${DOTFILES_PATH:="$HOME/.dotfiles"}"

# override location when running on GitHub Codespaces since it's cloned automatically:
# https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles
if [[ "$CODESPACES" = "true" ]]; then
  DOTFILES_PATH="/workspaces/.codespaces/.persistedshare/dotfiles"
  ln -sf "$DOTFILES_PATH" ~/.dotfiles
elif [[ ! -f "README.md" ]]; then
  # clone this repo if this script is all by its lonesome
  git clone https://github.com/jakejarvis/dotfiles.git "$DOTFILES_PATH"

  echo "Successfully cloned the full repo to '$DOTFILES_PATH'"
  echo "Run install.sh from that directory to continue. Exiting now..."
  exit 0
fi

# set up symlinks from various default paths to files in this repo
if [[ ! -d ~/.config ]]; then
  mkdir -p ~/.config
fi
ln -sf "$DOTFILES_PATH/zsh/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_PATH/zsh/.zprofile" ~/.zprofile
ln -sf "$DOTFILES_PATH/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_PATH/git/.gitignore_global" ~/.gitignore_global
ln -sf "$DOTFILES_PATH/nano/.nanorc" ~/.nanorc
ln -sf "$DOTFILES_PATH/starship/config.toml" ~/.config/starship.toml

if [[ "$(uname)" = "Darwin" ]]; then
  # suppress terminal login banners
  touch ~/.hushlogin

  # final symlinks
  if [[ ! -d ~/.ssh ]]; then
    mkdir -p ~/.ssh && chmod 700 ~/.ssh
  fi
  ln -sf "$DOTFILES_PATH/ssh/.ssh/config" ~/.ssh/config

  # shellcheck disable=SC1090,SC1091
  source "$DOTFILES_PATH/macos/macos.sh"
fi

echo "🎉 Done!"
