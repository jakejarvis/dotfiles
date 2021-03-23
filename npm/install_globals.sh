#!/usr/bin/env bash

set -euo pipefail

# npm ls --global --parseable --depth=0 | awk '{gsub(/\/.*\//,"",$1); print}' | sort -u
packages=(
  @babel/cli
  @babel/core
  @lhci/cli
  autoprefixer
  eslint
  express-generator
  express
  firebase-tools
  gatsby-cli
  gitmoji-cli
  gulp
  json-server
  netlify-cli
  newman
  nodemon
  npm-check
  postcss-cli
  postcss
  prettier
  standard
  stylelint
  superstatic
  vercel
  webtorrent-cli
  yo
)

for p in "${packages[@]}"; do
  npm install --global "$p" || echo "$p not found"
done
