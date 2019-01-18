# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$(go env GOPATH)/bin"
export PATH=$PATH:"$HOME/adt-bundle-mac/sdk/platform-tools"
export PATH=$PATH:"$HOME/.fastlane/bin"
export PATH=$PATH:"/opt/metasploit-framework/bin"
#export PATH=$PATH:"/usr/local/opt/mongodb@3.2/bin"
#export PATH=$PATH:"/Users/jake/Library/Python/3.7/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"

eval $(thefuck --alias)    # https://github.com/nvbn/thefuck

# Path to your oh-my-zsh installation.
export ZSH="/Users/jake/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  colorize
  pip
  python
  brew
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export VISUAL="nano"
export EDITOR="nano"

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

#alias ip="dig +short myip.opendns.com A @resolver1.opendns.com"
#alias ipv4="dig +short myip.opendns.com A @resolver1.opendns.com"
#alias ipv6="dig +short -6 myip.opendns.com AAAA @resolver1.ipv6-sandbox.opendns.com"

alias ip="ipv4"
alias ipv4="curl -4 icanhazip.com"
alias ipv6="curl -6 icanhazip.com"
alias iplocal="ipconfig getifaddr en0"

alias dns-clear="networksetup -setdnsservers Wi-Fi"
alias dns-check="networksetup -getdnsservers Wi-Fi"
alias dns-set="networksetup -setdnsservers Wi-Fi "
alias dns-set-cloudflare="dns-set 1.1.1.1 1.0.0.1"
alias dns-set-google="dns-set 8.8.8.8 8.8.4.4"

alias flush="sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"
alias serve="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias hosts="sudo $EDITOR /etc/hosts"
alias speed="wget -O /dev/null http://cachefly.cachefly.net/100mb.test"
alias digg="dig @8.8.8.8 +nocmd any +multiline +noall +answer"

alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias update="brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update; gem cleanup"   # sudo softwareupdate -i -a; 

alias dc="docker-compose"
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias gundo="git push -f origin HEAD^:master"

alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""

alias unq="sudo xattr -rd com.apple.quarantine"

s3ls() {
  aws s3 ls s3://$1
}

docker-bash() {
  docker exec -ti $1 /bin/bash
}

mkcdir() {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

eval "$(rbenv init -)"
