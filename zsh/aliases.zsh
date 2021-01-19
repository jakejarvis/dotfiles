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

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

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
alias digg="dig @1.1.1.1 +nocmd any +multiline +noall +answer"

# Update: brew, npm, gem, app store, macos
update() {
  NC="\033[0m"
  YELLOW="\033[0;33m"

  sudo -v

  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  # git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask" fetch --unshallow
  brew upgrade
  brew upgrade --cask --greedy
  brew cleanup

  echo -e "${YELLOW}Updating NPM/Yarn packages...${NC}"
  npm install npm@latest --global
  npm update --global
  yarn global upgrade

  echo -e "${YELLOW}Updating Ruby gems...${NC}"
  gem update --system
  gem update
  # gem upgrade --user-install
  gem cleanup

  # https://stackoverflow.com/a/3452888
  echo -e "${YELLOW}Updating pip packages...${NC}"
  pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U

  echo -e "${YELLOW}Updating Composer packages...${NC}"
  composer global update

  echo -e "${YELLOW}Updating Oh-My-ZSH...${NC}"
  omz update

  echo -e "${YELLOW}Updating MAS apps...${NC}"
  mas upgrade

  echo -e "${YELLOW}Updating macOS system...${NC}"
  sudo softwareupdate -ia --include-config-data
}

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
alias finder="open -a Finder ./"

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
alias github="gh repo view --web"
alias gist="gh gist create --web"
alias ghnew="gh repo create"
alias ghfork="gh repo fork"
alias ghci="hub ci-status --verbose"
glall() {
  # pull all remote branches
  # https://stackoverflow.com/a/10312587
  for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
  git fetch --all
  git pull --all
}

#
# Docker
#
alias d="docker"
alias dps="docker ps -a"
# build and run:
# https://stackoverflow.com/questions/45141402/build-and-run-dockerfile-with-one-command/59220656#59220656
dbar() {
  docker build --no-cache . | tee /dev/tty | tail -n1 | cut -d' ' -f3 | xargs -I{} docker run --rm -i {}
}
dsh() {
  docker exec -it "$1" /bin/sh
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

#
# Node
#
alias npm_clean="rm -rf node_modules && npm cache clean && npm install"
alias yarn_clean="rm -rf node_modules && yarn cache clean && yarn install"

#
# Hugo
#
make_hugo() {
  # parentheses lets us cd to Hugo path without changing our current location
  (
    cd "$GOPATH/src/github.com/gohugoio/hugo" \
    && git checkout master \
    && mage uninstall \
    && git pull origin master \
    && git reset --hard HEAD \
    && mage -v hugo \
    && HUGO_BUILD_TAGS=extended mage -v install
  )
}
# run `hugo config` first to make sure we're in a Hugo directory:
alias hugo_clean="hugo config 1>/dev/null && rm -rf public/ resources/ build/"

alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""

alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to clipboard.'"
alias pubkey_rsa="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

alias ytdl="youtube-dl -f bestvideo+bestaudio"
alias ytmp3="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 320K"

alias weather="curl -4 https://wttr.in/Boston"
