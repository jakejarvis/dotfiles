# Default paths
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Go
export GOPATH="$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

# Ruby
export RUBY_HOME=/usr/local/opt/ruby/bin
export GEM_PATH=~/.gem/ruby/2.6.0
export PATH="$RUBY_HOME:$PATH"
export PATH="$GEM_PATH/bin:$PATH"

# Metasploit
export PATH="/opt/metasploit-framework/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# ----- Third-party additions below: -----

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jake/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jake/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/completion.zsh.inc'; fi

# added by travis gem
[ -f /Users/jake/.travis/travis.sh ] && source /Users/jake/.travis/travis.sh
