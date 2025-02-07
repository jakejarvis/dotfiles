#!/usr/bin/env bash

set -e

if ! command -v fnm &>/dev/null; then
  echo "fnm not found, exiting..."
  return
fi

fnm install --latest --corepack-enabled
npm install --global npm

# npm ls --global --parseable --depth=0 | awk '{gsub(/\/.*\//,"",$1); print}' | sort -u
packages=(
  @angular/cli
  @babel/cli
  @babel/core
  @lhci/cli
  @vercel/ncc
  autoprefixer
  cross-env
  depcheck
  dts-gen
  dtslint
  esbuild
  eslint
  gatsby-cli
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
  serverless
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
  NPM_CONFIG_FUND=false npm install --global --no-audit "$p" || echo "$p not found"
done

unset p packages
