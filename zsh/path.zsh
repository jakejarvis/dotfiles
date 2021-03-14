# Default paths
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# Go
export GOPATH="$HOME/golang"
#export GOROOT="/usr/local/opt/go/libexec"
export PATH="$GOPATH/bin:$PATH"
#export PATH="$GOROOT/bin:$PATH"

# Ruby
export RUBY_HOME="/opt/homebrew/opt/ruby/bin"
export GEM_PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin"
export PATH="$RUBY_HOME:$PATH"
export PATH="$GEM_PATH:$PATH"

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml)"
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Python
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# openjdk
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Metasploit
export PATH="/opt/metasploit-framework/bin:$PATH"

# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# misc.
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/whois/bin:$PATH"
export PATH="/opt/homebrew/opt/jpeg-turbo/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/opt/jpeg-turbo/lib"
#export CPPFLAGS="-I/opt/homebrew/opt/jpeg-turbo/include"

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# ----- Third-party additions below: -----

# Google Cloud SDK
[ -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
