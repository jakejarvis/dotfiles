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

# pyenv
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# This is SOOOOOOOO SLOW.... lazy-load nvm instead with `usenvm`:
alias usenvm='[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"; [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jake/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jake/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jake/google-cloud-sdk/completion.zsh.inc'; fi

# added by travis gem
[ -f /Users/jake/.travis/travis.sh ] && source /Users/jake/.travis/travis.sh
