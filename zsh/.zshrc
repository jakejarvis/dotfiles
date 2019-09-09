# Path to cloned dotfiles repo
export DOTFILES=$HOME/.dotfiles/zsh

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Default to nano 'cause I'm a wimp
export VISUAL="nano"
export EDITOR="nano"

# Adjust history for speed
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Oh My ZSH settings
ZSH_CUSTOM=$DOTFILES
ZSH_THEME="agnoster"
plugins=(
  colorize
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Load everything!
source $ZSH/oh-my-zsh.sh

# Fix slow paste problem w/ zsh-syntax-highlighting plugin
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Prettify `ls`
# `man ls` to decode this mess
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Other miscellaneous settings
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
