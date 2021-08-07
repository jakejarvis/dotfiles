#!/usr/bin/env bash

set -euo pipefail

# fetch and install Volta (better nvm)
if ! command -v volta &> /dev/null
then
  curl https://get.volta.sh | bash -s -- --skip-setup
fi

volta install node@lts
volta install node@latest # remove when LTS officially supports arm64
volta install npm@6 # having issues with npm@7 and volta
volta install yarn@1

volta list node
volta list npm
volta list yarn

# npm ls --global --parseable --depth=0 | awk '{gsub(/\/.*\//,"",$1); print}' | sort -u
packages=(
  @11ty/eleventy
  @babel/cli
  @babel/core
  @lhci/cli
  autoprefixer
  browserify
  eslint
  express
  express-generator
  firebase-tools
  gatsby-cli
  gulp
  json-server
  netlify-cli
  nodemon
  npm-check-updates
  pm2
  postcss
  postcss-cli
  prettier
  release-it
  rollup
  serve
  standard
  stylelint
  svgo
  terser
  vercel
  webpack
  webpack-cli
)

for p in "${packages[@]}"; do
  npm install --global "$p" || echo "$p not found"
done

volta list all
