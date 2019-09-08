# Enable aliases to be sudo'ed
alias sudo="sudo "

alias ll="ls -lah"
alias la="ls -a"
alias l="ls -lh"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

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
alias hosts="sudo $EDITOR /etc/hosts"
alias speed="wget -O /dev/null http://cachefly.cachefly.net/100mb.test"
alias digg="dig @8.8.8.8 +nocmd any +multiline +noall +answer"

alias update="brew update; brew upgrade; brew cask upgrade; brew cleanup; nvm install node --latest-npm --reinstall-packages-from=node; npm install npm -g; npm update -g; gem update --system; gem update; gem cleanup; sudo gem update --system; sudo gem update; sudo gem cleanup; sudo softwareupdate -ia --include-config-data;"

alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias displays="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
alias screenfetch="neofetch"

alias ripfinder="killall Finder"
alias ripdock="killall Dock"
alias ripmenu="killall SystemUIServer NotificationCenter"

alias finder="open ./"
alias vs="code ./"

alias gundo="git reset --soft HEAD~1"
alias gc="git add . && git commit -m "
alias gs="git status -sb"
alias gd="git diff"

alias dc="docker-compose"

alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""

alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

alias weather="curl -4 http://wttr.in/Boston"
