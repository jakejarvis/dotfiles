# Default paths
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Go
export GOPATH="$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"

# Ruby
export RUBY_HOME=/usr/local/opt/ruby/bin
export GEM_PATH=/usr/local/lib/ruby/gems/2.7.0
export PATH="$RUBY_HOME:$PATH"
export PATH="$GEM_PATH/bin:$PATH"

# Metasploit
export PATH="/opt/metasploit-framework/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# ----- Third-party additions below: -----

# Google Cloud SDK
[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# added by travis gem
[ -f /Users/jake/.travis/travis.sh ] && source /Users/jake/.travis/travis.sh
