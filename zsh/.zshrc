#!/usr/bin/env zsh

# path to this directory:
export ZSH_CUSTOM=~/.dotfiles/zsh

# load .zsh files from the above dir in this order:
for _dotzsh in "$ZSH_CUSTOM"/custom/{common,env,path,aliases,functions,plugins}.zsh; do
  if [[ -f "$_dotzsh" ]]; then
    source "$_dotzsh"
  fi
done
unset _dotzsh

# macos.zsh has aliases, functions, etc specific to macOS:
if [[ "$OSTYPE" = "darwin"* ]] && [[ -f "$ZSH_CUSTOM"/custom/macos.zsh ]]; then
  source "$ZSH_CUSTOM"/custom/macos.zsh
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
