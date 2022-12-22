if test ! "$(uname)" = "Darwin"; then
  exit 0
fi

# Default paths
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin${PATH+:$PATH}"

# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# Remap macOS core utils to GNU equivalents (from coreutils, findutils, gnu-*, etc.):
# https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da?permalink_comment_id=3049694#gistcomment-3049694
for p in "$(brew --prefix)"/opt/*/libexec/gnubin; do export PATH=$p:$PATH; done
# Ensure `man` refers to the new binaries:
for p in "$(brew --prefix)"/opt/*/libexec/gnuman; do export MANPATH=$p:$MANPATH; done

# Go
export GOPATH="$HOME/golang"
export PATH="$GOPATH/bin:$PATH"

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml)"
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# OpenJDK
export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"

# Metasploit
export PATH="/opt/metasploit-framework/bin:$PATH"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
