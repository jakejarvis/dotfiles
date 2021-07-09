#!/usr/bin/env bash

set -euo pipefail

# npm ls --global --parseable --depth=0 | awk '{gsub(/\/.*\//,"",$1); print}' | sort -u
packages=(
  @11ty/eleventy
  @ampproject/toolbox-cli
  @babel/cli
  @babel/core
  @lhci/cli
  autoprefixer
  eslint
  express
  express-generator
  firebase-tools
  gatsby-cli
  gitmoji-cli
  gulp
  is-up-cli
  json-server
  netlify-cli
  newman
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
  superstatic
  vercel
  webpack
  webpack-cli
  yo
)

for p in "${packages[@]}"; do
  npm install --global "$p" || echo "$p not found"
done
