#!/usr/bin/env bash

set -euo pipefail

# fetch and install Volta (better nvm)
if ! command -v volta &>/dev/null; then
  # curl https://get.volta.sh | bash -s -- --skip-setup
  brew install volta
fi

volta install node@latest # remove when LTS officially supports arm64
volta install npm@8
volta install yarn@1
volta fetch node@lts # not native on M1 but good to have

volta list node
volta list npm
volta list yarn

# npm ls --global --parseable --depth=0 | awk '{gsub(/\/.*\//,"",$1); print}' | sort -u
packages=(
  @babel/cli
  @babel/core
  @lhci/cli
  @vercel/ncc
  autoprefixer
  cross-env
  depcheck
  dtslint
  dts-gen
  esbuild
  eslint
  gzip-size-cli
  json-server
  markdownlint-cli2
  netlify-cli
  nodemon
  np
  npm-check-updates
  npm-name-cli
  pm2
  postcss
  postcss-cli
  prettier
  release-it
  rollup
  stylelint
  superstatic
  svgo
  terser
  typescript
  typesync
  vercel
  webpack
  webpack-cli
)

for p in "${packages[@]}"; do
  volta run --no-yarn -- npm install --global "$p" || echo "$p not found"
done

unset p packages

volta list all
