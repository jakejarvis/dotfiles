#!/usr/bin/env zsh

autoload -U colors && \
colors

autoload -Uz select-word-style && \
select-word-style bash

# autoload -Uz bracketed-paste-magic && \
# zle -N bracketed-paste bracketed-paste-magic
# zstyle ':bracketed-paste-magic' active-widgets '.self-*'

autoload -Uz url-quote-magic && \
zle -N self-insert url-quote-magic
zstyle ":urlglobber" url-other-schema ftp git gopher http https magnet && \

export DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster

# enable bash-like 'help' command for zsh:
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
unalias run-help 2>/dev/null
autoload run-help
alias help=run-help

# ---

setopt notify
setopt complete_aliases
setopt complete_in_word
setopt always_to_end
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
setopt inc_append_history
setopt rc_quotes
setopt extended_glob
setopt glob_dots
unsetopt case_glob
unsetopt beep  # kindly stfu
unsetopt list_beep
unsetopt correct
unsetopt correct_all

# ---

# kinda hacky way to traverse up to the root of the dotfiles repo
export DOTFILES="$(realpath "$(realpath "$(dirname "${0}")")/../..")"

export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR="nano"  # don't judge me
export VISUAL="code --new-window --wait"

export PAGER="less"
export LESS="$LESS -RF --mouse --silent"

# resolve GPG terminal at shell runtime
# fixes "signing failed: Inappropriate ioctl for device"
if tty -s 2>/dev/null; then
  GPG_TTY=$(tty)
  export GPG_TTY
fi

# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/theme-and-appearance.zsh#L5
# export LS_COLORS="Gxfxcxdxbxegedabagacad"
