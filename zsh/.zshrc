# path to this directory:
export ZSH_CUSTOM=~/.dotfiles/zsh

# load .zsh files from the above dir in this order:
for _dotzsh in "$ZSH_CUSTOM"/custom/{common,env,path,aliases,functions,plugins,macos}.zsh; do
  if [[ -f "$_dotzsh" ]]; then
    source "$_dotzsh"
  fi
done
unset _dotzsh

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
