# all of this is only for macOS
if [[ ! "$(uname)" = "Darwin" ]]; then
  return
fi

# export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"

# Rosetta hacks for M1
alias intel="arch -x86_64 /bin/zsh"
alias arm="arch -arm64 zsh"

# check & install updates for:
#  - brew
#  - node/npm
#  - ruby/gems
#  - pip
#  - app store
#  - macos
#  - zinit
system_update() {
  NC="\033[0m"
  YELLOW="\033[0;33m"

  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  brew upgrade
  # avoid annoying `(latest) != latest` cask updates:
  # shellcheck disable=SC2046
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  echo -e "${YELLOW}Updating global NPM/Yarn packages...${NC}"
  volta fetch node@latest
  volta install node@lts
  volta install yarn@1
  volta run --node lts --no-yarn -- npm update --global
  volta run --node lts --yarn 1 -- yarn global upgrade

  echo -e "${YELLOW}Updating Ruby and gems...${NC}"
  CONFIGURE_OPTS="$RUBY_CONFIGURE_OPTS" \
    rbenv install --skip-existing "$(rbenv install -l | grep -v - | tail -1)" && \
    rbenv global "$(rbenv install -l | grep -v - | tail -1)"
  gem install bundler foreman
  gem update
  gem cleanup
  rbenv rehash

  # https://stackoverflow.com/a/3452888
  echo -e "${YELLOW}Updating pip packages...${NC}"
  pip3 list --outdated --format=json | jq -r '.[] | .name+"="+.latest_version' | cut -d = -f 1 | xargs -n1 pip3 install -U

  echo -e "${YELLOW}Checking for App Store updates...${NC}"
  mas outdated

  echo -e "${YELLOW}Checking for macOS system updates...${NC}"
  softwareupdate --list

  echo -e "${YELLOW}Updating zinit...${NC}"
  zinit self-update
  zinit update --all
}

alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias forcetrash="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"
alias verify_sign="codesign --verify --deep --verbose"

alias gpu="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"

alias ripfinder="killall Finder"
alias ripdock="killall Dock"
alias ripmenu="killall SystemUIServer NotificationCenter"

# open current directory in Finder
alias finder="open -a Finder ."

alias dns-clear="networksetup -setdnsservers Wi-Fi"
alias dns-check="networksetup -getdnsservers Wi-Fi"
alias dns-set="networksetup -setdnsservers Wi-Fi "
alias dns-set-cloudflare="dns-set 1.1.1.1 1.0.0.1"
alias dns-set-google="dns-set 8.8.8.8 8.8.4.4"
alias flush="sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper; sudo dscacheutil -flushcache"

# uncomment to use VS Code insiders build
# alias code="code-insiders"
alias vs="code ."

# Xcode simulators
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

alias firefox="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias ff="firefox"
