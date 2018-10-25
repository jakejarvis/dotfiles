### Install
# To source this .bashrc, create .bash_profile containing:
#
#   if [ -f ~/.bashrc ]; then
#     source ~/.bashrc
#   fi
#
###############


###############
# Source other files

# Senstive functions which are not pushed to Github
[ -r ~/.bash_private ] && source ~/.bash_private

# On macOS: brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# Get it from the original Git repo: 
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi


###############
# Prettify (custom)
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
# `man ls` to decode this mess
export LSCOLORS=ExFxBxDxCxegedabagacad


###############
# Exports (custom)

export EDITOR="nano"
export VISUAL="nano"

export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$(go env GOPATH)/bin"
export PATH=$PATH:"$HOME/adt-bundle-mac/sdk/platform-tools"
export PATH=$PATH:"$HOME/.fastlane/bin"
export PATH=$PATH:"/opt/metasploit-framework/bin"
export PATH=$PATH:"/usr/local/opt/mongodb@3.2/bin"

eval $(thefuck --alias)    # https://github.com/nvbn/thefuck

#export JAVA_HOME="$(/usr/libexec/java_home -v 1.6)"
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"



###############
# Aliases (custom)

# Enable aliases to be sudo’ed
alias sudo="sudo "

alias ll="ls -lah"
alias la="ls -a"
alias l="ls -lh"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

alias ip="dig +short myip.opendns.com A @resolver1.opendns.com"
alias ip4="dig +short myip.opendns.com A @resolver1.opendns.com"
alias ip6="dig +short -6 myip.opendns.com AAAA @resolver1.ipv6-sandbox.opendns.com"
alias iplocal="ipconfig getifaddr en0"

alias flush="sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"
alias serve="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias hosts="sudo $EDITOR /etc/hosts"
alias speed="wget -O /dev/null http://cachefly.cachefly.net/100mb.test"
alias digg="dig @8.8.8.8 +nocmd any +multiline +noall +answer"

alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias update="brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup"   # sudo softwareupdate -i -a; 

alias dc="docker-compose"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias gundo="git push -f origin HEAD^:master"

alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""

alias unq="sudo xattr -rd com.apple.quarantine"

docker-bash() {
  docker exec -ti $1 /bin/bash
}

mkcdir() {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}
