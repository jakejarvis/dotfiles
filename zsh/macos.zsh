# Rosetta hacks for M1 Macs
alias intel="arch -x86_64 /bin/zsh"
alias arm="arch -arm64 /opt/homebrew/bin/zsh"

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

# Update: brew, npm, gems, pip, app store, macos
system_update() {
  NC="\033[0m"
  YELLOW="\033[0;33m"

  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  brew upgrade
  # avoid annoying `(latest) != latest` cask updates:
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  echo -e "${YELLOW}Updating NPM/Yarn packages...${NC}"
  volta install node@latest
  volta install npm@8
  volta install yarn@1
  volta run --node latest --npm 8 --no-yarn -- npm update --global
  volta run --node latest --yarn 1 -- yarn global upgrade

  echo -e "${YELLOW}Updating Ruby gems...${NC}"
  gem update --system
  gem update
  # gem upgrade --user-install
  gem cleanup

  # https://stackoverflow.com/a/3452888
  echo -e "${YELLOW}Updating pip packages...${NC}"
  pip3 list --outdated --format=json | jq -r '.[] | .name+"="+.latest_version' | cut -d = -f 1 | xargs -n1 pip3 install -U

  echo -e "${YELLOW}Updating MAS apps...${NC}"
  mas outdated

  echo -e "${YELLOW}Check for macOS system updates...${NC}"
  softwareupdate --list

  echo -e "${YELLOW}Updating Oh-My-ZSH...${NC}"
  omz update
}

alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"
alias verify_sign="codesign --verify --deep --verbose"

alias gpu="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
alias screenfetch="neofetch"

alias ripfinder="sudo killall Finder"
alias ripdock="sudo killall Dock"
alias ripmenu="sudo killall SystemUIServer NotificationCenter"

# open current directory in Finder
alias finder="open -a Finder ./"

# uncomment to use VS Code insiders build
# alias code="code-insiders"
alias vs="code ./"

# Xcode simulators
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias ff="firefox"
