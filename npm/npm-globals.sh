#!/usr/bin/env bash

### Install global npm packages listed in npm-globals.txt
# https://github.com/br3ndonland/dotfiles/blob/main/script/npm-globals.sh

set -euo pipefail

package_dir="$(npm config get prefix)/lib"
packages=$(npm ls -g --parseable --depth=0)
packages=${packages//$package_dir\/node_modules\//}

echo "* Installing global npm packages..."

while read -r p; do
  installed=$(echo "$packages" | grep -ce "^$p\$")
  if [ "$installed" == "0" ]; then
    echo "Installing $p..."
    npm install -g "$p" || echo "!! Error: package $p not found in npm."
  else
    echo "$p is already installed."
  fi
done <~/.dotfiles/npm/npm-globals.txt

echo "* Done installing npm packages."
