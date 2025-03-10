#!/usr/bin/env zsh

# Homebrew's location is different depending on OS...
# https://github.com/Homebrew/install/blob/master/install.sh#L122
if [[ -d /opt/homebrew ]]; then
  # macOS on Apple Silicon
  BREW_BIN="/opt/homebrew/bin/brew"
elif [[ -d "$HOME/.linuxbrew" ]]; then
  # Linux, user install
  # NOTE: definitely discouraged, maybe deprecated? https://github.com/Homebrew/install/pull/702
  BREW_BIN="$HOME/.linuxbrew/bin/brew"
elif [[ -d /home/linuxbrew/.linuxbrew ]]; then
  # Linux, system install
  BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
else
  # macOS on Intel (hopefully, or else we're kinda doomed...)
  BREW_BIN="/usr/local/bin/brew"
fi

# set PATHs for Homebrew (if we found it)
if [[ -x "$BREW_BIN" ]]; then
  eval "$("$BREW_BIN" shellenv)"

  # macOS-only remedies
  if [[ "$OSTYPE" = darwin* ]]; then
    # manually add VS Code 'code' command to path
    # https://code.visualstudio.com/docs/setup/mac#_alternative-manual-instructions
    if [[ -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then
      path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $path)
    fi

    # remap macOS core utils to GNU equivalents without needing the 'g' prefix (e.g. ggrep -> grep):
    # https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da?permalink_comment_id=3049694#gistcomment-3049694
    for gnubin in "$(brew --prefix)"/opt/*/libexec/gnubin; do
      path=($gnubin $path)
    done

    # ensure man also points to the GNU manuals
    for gnuman in "$(brew --prefix)"/opt/*/libexec/gnuman; do
      manpath=($gnuman $manpath)
    done

    # declare the base xcode & homebrew paths first
    LDFLAGS="${LDFLAGS:+"$LDFLAGS "}-L$(brew --prefix)/lib"
    CFLAGS="${CPPFLAGS:+"$CPPFLAGS "}-I$(brew --prefix)/include -I$(brew --prefix openjdk)/include"
    PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}$(brew --prefix)/lib/pkgconfig"

    # tell compilers and pkg-config where to find the homebrew versions (rather than the vendored macOS versions) of the
    # following packages:
    declare -a compiler_libs=(
      bzip2
      curl
      jemalloc
      libffi
      gettext
      libxml2
      ncurses
      openssl@1.1
      readline
      sqlite
      tcl-tk
      icu4c
      xz
      zlib
    )

    # append the specific paths for each of the above libraries
    for lib in $compiler_libs; do
      # TODO: 'brew --prefix' got pretty slow in Homebrew v4, so these calls should be cleaned up/optimized
      # https://github.com/Homebrew/brew/commit/ca32473a672ef08be60792a921a3a1e4dcc32e13
      LDFLAGS+=" -L$(brew --prefix $lib)/lib"
      CFLAGS+=" -I$(brew --prefix $lib)/include"
      PKG_CONFIG_PATH+=":$(brew --prefix $lib)/lib/pkgconfig"
    done

    # it's easier to do ruby opts separately as it needs different libraries than above in a very different format
    RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-jemalloc-dir=$(brew --prefix jemalloc) --with-libffi-dir=$(brew --prefix libffi) --with-libyaml-dir=$(brew --prefix libyaml) $RUBY_CONFIGURE_OPTS"

    # add xcode flags last
    if command -v xcrun &>/dev/null; then
      LDFLAGS+=" -L$(xcrun --show-sdk-path)/usr/lib"
      CFLAGS+=" -I$(xcrun --show-sdk-path)/usr/include"
      PKG_CONFIG_PATH+=":$(brew --prefix $lib)/lib/pkgconfig"
    fi

    # finally all done with this mess
    export LDFLAGS CPPFLAGS PKG_CONFIG_PATH RUBY_CONFIGURE_OPTS
    unset gnubin gnuman compiler_libs lib
  fi
fi

# go
if [[ -d "$HOME/golang" ]]; then
  export GOPATH="$HOME/golang"
  path=("$GOPATH/bin" $path)
fi

# rust/cargo
if [[ -d "$HOME/.cargo" ]]; then
  path=("$HOME/.cargo/bin" $path)
fi

# fnm
if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# rbenv
if command -v rbenv &>/dev/null; then
  eval "$(rbenv init - --no-rehash zsh)"
fi

# pyenv
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init - --no-rehash zsh)"

  # pyenv-virtualenv
  if command -v pyenv-virtualenv-init &>/dev/null; then
    eval "$(pyenv virtualenv-init - zsh)"
  fi
fi

# pnpm
if [[ -d "$HOME/.local/share/pnpm" ]]; then
  path=("$HOME/.local/share/pnpm" $path)
fi

# docker user mode, see: https://docs.docker.com/desktop/mac/permission-requirements/#installing-symlinks
if [[ -d "$HOME/.docker/bin" ]]; then
  path=("$HOME/.docker/bin" $path)
fi

# let zsh sort out formatting and deduplication
typeset -aU path fpath manpath
export PATH FPATH MANPATH
