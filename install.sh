#!/usr/bin/env bash

set -e

echo "👋  Deep breaths, everything will (probably) be fine!"

# Set up symbolic links for ZSH and Git pointing to this cloned repo
ln -sf "$HOME"/.dotfiles/zsh/.zshrc "$HOME"/.zshrc
ln -sf "$HOME"/.dotfiles/git/.gitconfig "$HOME"/.gitconfig
ln -sf "$HOME"/.dotfiles/git/.gitignore_global "$HOME"/.gitignore_global

# Get Oh My ZSH up and running
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Make ZSH the default shell environment (maybe unnecessary on Catalina?)
# shellcheck disable=SC2230
chsh -s "$(which zsh)"

if [ "$(uname)" == "Darwin" ]; then
  # shellcheck disable=SC1091
  source ./macos/macos.sh
else
  echo ""
  echo "This isn't a Mac, so we're all done here!"
  echo "Logout/restart now for the full effects."
  exit 0
fi
