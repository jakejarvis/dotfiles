# super minimal bash setup for fallback, debugging, miscellaneous tasks, etc.

# disable unnecessary history
set +o history
export SHELL_SESSION_HISTORY=0

# hide macOS zsh default warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# set PATH, MANPATH, etc., for Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
  # macOS on Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  # macOS on Intel
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
  # Linux, user install
  eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  # Linux, system install
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# fnm
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell bash)"
fi

# rbenv
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init - --no-rehash bash)"
fi

# pyenv
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init - --no-rehash bash)"

  # pyenv-virtualenv
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  if command -v pyenv-virtualenv-init &>/dev/null; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# pyenv-virtualenv
if command -v pyenv-virtualenv-init &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
