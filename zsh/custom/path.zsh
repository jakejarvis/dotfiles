#!/usr/bin/env zsh

# set PATH, MANPATH, etc., for Homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
  # macOS on Apple Silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  # macOS on x86
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
  # Linux, system install
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ -d "$HOME/.linuxbrew" ]]; then
  # Linux, user install
  eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
fi

# a lot of this file only applies to macOS
if [[ "$OSTYPE" = "darwin"* ]]; then
  # remap macOS core utils to GNU equivalents (from coreutils, findutils, gnu-*, etc.):
  # https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da?permalink_comment_id=3049694#gistcomment-3049694
  if command -v brew &>/dev/null; then
    for gbin in "$(brew --prefix)"/opt/*/libexec/gnubin; do
      export PATH="$gbin:$PATH"
    done
    # Ensure `man` refers to the new binaries:
    for gman in "$(brew --prefix)"/opt/*/libexec/gnuman; do
      export MANPATH="$gman:$MANPATH"
    done
    unset gbin gman

    # shellcheck disable=SC2155
    export HELPDIR="$(brew --prefix)/share/zsh/help"

    # OpenJDK
    # shellcheck disable=SC2155
    export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"

    # macOS-only fixes for rbenv/ruby below
    # shellcheck disable=SC2155
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-jemalloc-dir=$(brew --prefix jemalloc)"

    # tell compilers where to find all of this stuff
    # shellcheck disable=SC2155
    export LDFLAGS="$LDFLAGS -L$(brew --prefix openssl@1.1)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix jemalloc)/lib"
    # shellcheck disable=SC2155
    export CPPFLAGS="$CPPFLAGS -I$(brew --prefix openjdk)/include -I$(brew --prefix openssl@1.1)/include -I$(brew --prefix readline)/include -I$(brew --prefix jemalloc)/include"
  fi
fi

# go
if [[ -d "$HOME/golang" ]]; then
  export GOPATH="$HOME/golang"
  export PATH="$GOPATH/bin:$PATH"
fi

# rust/cargo
if [[ -d "$HOME/.cargo" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# rbenv
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init --no-rehash - zsh)"
fi

# pyenv
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init --no-rehash - zsh)"
fi

# volta
if [[ -d "$HOME/.volta" ]]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi
