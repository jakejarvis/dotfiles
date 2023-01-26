#!/usr/bin/env zsh

autoload -U colors && colors

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz select-word-style
select-word-style bash

# enable bash-like 'help' command for zsh:
# https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
unalias run-help 2>/dev/null
autoload run-help
alias help=run-help

# ---

setopt notify
setopt complete_in_word
setopt always_to_end
setopt extended_history
setopt hist_expire_dups_first
# setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
setopt inc_append_history
setopt rc_quotes
setopt autocd
setopt extended_glob
setopt glob_dots
unsetopt case_glob
unsetopt beep  # kindly stfu
unsetopt correct
unsetopt correct_all

# ---

bindkey -e
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# ---

export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR="nano"  # don't judge me
export VISUAL="code"

# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/theme-and-appearance.zsh#L5
# export LS_COLORS="Gxfxcxdxbxegedabagacad"
