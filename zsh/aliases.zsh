# Enable aliases to be sudo'ed
alias sudo="sudo "

alias reload="source ~/.zshrc"

alias ll="ls -lah"
alias la="ls -a"
alias l="ls -lh"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

#
# Remap macOS core utils to GNU
#
alias sed="gsed"
alias grep="ggrep"
alias find="gfind"
alias make="gmake"
alias tar="gtar"
alias which="gwhich"
alias awk="gawk"

# My own creation! See: https://github.com/jakejarvis/simpip
alias ipv4="curl -4 simpip.com --max-time 1 --proto-default https --silent"
alias ipv6="curl -6 simpip.com --max-time 1 --proto-default https --silent"
alias ip="ipv4; ipv6"
alias iploc="ipconfig getifaddr en0"
alias ips="ip; ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

alias dns-clear="networksetup -setdnsservers Wi-Fi"
alias dns-check="networksetup -getdnsservers Wi-Fi"
alias dns-set="networksetup -setdnsservers Wi-Fi "
alias dns-set-cloudflare="dns-set 1.1.1.1 1.0.0.1"
alias dns-set-google="dns-set 8.8.8.8 8.8.4.4"
alias flush="sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"

alias hosts="sudo $EDITOR /etc/hosts"
alias speed="wget -O /dev/null http://cachefly.cachefly.net/100mb.test"
alias digg="dig @8.8.8.8 +nocmd any +multiline +noall +answer"

# Update: brew, npm, gem, app store, macos
alias update="brew update; brew upgrade; brew cask upgrade; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update; gem cleanup; sudo gem update --system; sudo gem update; sudo gem cleanup; mas upgrade;"  # sudo softwareupdate -ia --include-config-data;

alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias gpu="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
alias screenfetch="neofetch"

alias ripfinder="sudo killall Finder"
alias ripdock="sudo killall Dock"
alias ripmenu="sudo killall SystemUIServer NotificationCenter"

# open current directory in Finder
alias opdir="open -a Finder ./"

# use VS Code insiders build
# alias code="code-insiders"
alias vs="code ./"

alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias ff="firefox"

#
# Git
#
# required: https://github.com/github/hub
# `brew install hub`
#
alias git="hub"
alias g="hub"
alias gc="git commit -m"  # + commit message
alias gca="git add . && git commit -m"  # + commit message
alias gs="git status -sb"
alias gl="git log --pretty=short"
alias gd="git diff"
alias gds="git diff --staged"
alias gpom="git push origin main"
alias glom="git pull origin main"
alias gpo="git push origin"  # + branch name
alias glo="git pull origin"  # + branch name
alias gphm="git push hosted main"  # self-hosted git
alias gb="git checkout"  # + existing branch name
alias gbn="git checkout -b"  # + new branch name
alias grm="git rebase -i origin/main"
alias gsub="git submodule update --recursive --remote"
alias gundo="git reset --soft HEAD~1"
alias greset="git reset"
alias gsync="hub sync"
alias github="hub browse"
alias gist="hub gist create --open"
alias ghnew="gh repo create"
alias ghfork="gh repo fork"
alias ghci="hub ci-status --verbose"

#
# Docker
#
alias d="docker"
alias dit="docker run -it"
alias dps="docker ps -a"
dsh() {
  docker exec -ti "$1" /bin/sh
}
dhub() {
  # search docker hub by tag
  curl -sS "https://registry.hub.docker.com/v2/repositories/$1/tags/" | jq '."results"[]["name"]' | sort
}
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr="docker-compose down && docker-compose up -d"
alias dcl="docker-compose logs -f"
alias docker-clean-containers='docker ps --filter "status=exited" -a -q | xargs docker rm -v'
alias docker-clean-images='docker images --filter "dangling=true" -q | xargs docker rmi'
alias docker-clean-volumes='docker volume ls --filter dangling=true | xargs docker volume rm'

#
# Node
#
alias npm-reset="rm -rf node_modules && npm cache clean && npm install"
alias yarn-reset="rm -rf node_modules && yarn cache clean && yarn install"

#
# Hugo
#
make_hugo() {
  # parentheses lets us cd to Hugo path without changing user's current location
  (
    cd "$GOPATH/src/github.com/gohugoio/hugo" \
    && git pull origin master \
    && git reset --hard HEAD \
    && git checkout master \
    && mage -v hugo \
    && HUGO_BUILD_TAGS=extended mage -v install
  )
}
# run `hugo config` to make sure we're in a Hugo directory:
alias hugo-clean="hugo config 1>/dev/null && rm -rf public/ resources/ build/"

alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""

alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to clipboard.'"
alias pubkey_rsa="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

alias ytdl="youtube-dl -f bestvideo+bestaudio"
alias ytmp3="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 320K"

alias weather="curl -4 https://wttr.in/Boston"
