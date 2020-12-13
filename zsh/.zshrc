# uncomment to profile slow startup time
# zmodload zsh/zprof

# Path to cloned dotfiles repo
export DOTFILES=$HOME/.dotfiles

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Default to nano 'cause I'm a wimp
export EDITOR="nano"
export VISUAL="code"
export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Adjust history for speed
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Oh My ZSH settings
ZSH_CUSTOM=$DOTFILES/zsh
ZSH_THEME="agnoster"
DEFAULT_USER=jake
DISABLE_UPDATE_PROMPT=true

# Oh My ZSH plugins
plugins=(
  colorize
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Perform compinit only once a day for speed
# https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  echo "reloading compinit"
  compinit
done
compinit -C

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

# uncomment to profile slow startup time
# zprof
# zmodload -u zsh/zprof
