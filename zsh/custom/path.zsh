# a lot of this file only applies to macOS
if [[ "$(uname)" = "Darwin" ]]; then
  # set PATH, MANPATH, etc., for Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # remap macOS core utils to GNU equivalents (from coreutils, findutils, gnu-*, etc.):
  # https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da?permalink_comment_id=3049694#gistcomment-3049694
  for gbin in "$(brew --prefix)"/opt/*/libexec/gnubin; do
    export PATH="$gbin:$PATH"
  done
  # Ensure `man` refers to the new binaries:
  for gman in "$(brew --prefix)"/opt/*/libexec/gnuman; do
    export MANPATH="$gman:$MANPATH"
  done
  unset gbin gman

  # OpenJDK
  export PATH="$HOMEBREW_PREFIX/opt/openjdk/bin:$PATH"

  # metasploit
  export PATH="/opt/metasploit-framework/bin:$PATH"

  # macOS-only fixes for rbenv/ruby below
  # shellcheck disable=SC2155
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml)"
fi

# go
export GOPATH="$HOME/golang"
export PATH="$GOPATH/bin:$PATH"

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# rust/cargo
export PATH="$HOME/.cargo/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
