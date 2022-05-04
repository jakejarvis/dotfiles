#!/usr/bin/env bash

set -euo pipefail

extensions=(
  amazonwebservices.aws-toolkit-vscode
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  EditorConfig.EditorConfig
  esbenp.prettier-vscode
  GitHub.github-vscode-theme
  GitHub.vscode-pull-request-github
  golang.go
  mrmlnc.vscode-duplicate
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode-remote.vscode-remote-extensionpack
  ms-vscode.wordcount
  ms-vsliveshare.vsliveshare
  ms-vsonline.vsonline
  PKief.material-icon-theme
  stylelint.vscode-stylelint
)

for e in "${extensions[@]}"; do
  code --install-extension "$e"
done
