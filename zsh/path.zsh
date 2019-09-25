# Default paths
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Go
export GOPATH="$HOME/golang"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Metasploit
export PATH="/opt/metasploit-framework/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Rust/Cargo
export PATH="$HOME/.cargo/bin:$PATH"


# ----- Third-party additions below: -----

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jake/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jake/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/completion.zsh.inc'; fi

# added by travis gem
[ -f /Users/jake/.travis/travis.sh ] && source /Users/jake/.travis/travis.sh
