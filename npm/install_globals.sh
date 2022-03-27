#!/usr/bin/env bash

set -euo pipefail

# fetch and install Volta (better nvm)
if ! command -v volta &> /dev/null
then
  curl https://get.volta.sh | bash -s -- --skip-setup
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
  @11ty/eleventy
  @babel/cli
  @babel/core
  @lhci/cli
  @vercel/ncc
  autoprefixer
  browserify
  dtslint
  dts-gen
  eslint
  express
  express-generator
  firebase-tools
  gatsby-cli
  gulp
  gzip-size-cli
  json-server
  netlify-cli
  next
  nodemon
  npm-check-updates
  npm-name-cli
  pm2
  postcss
  postcss-cli
  prettier
  release-it
  rollup
  standard
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

volta list all
