#!/usr/bin/env zsh

export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"
# export BROWSER="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# Rosetta hacks for M1
alias intel="arch -x86_64 /bin/zsh"
alias arm="arch -arm64 zsh"

system_update() {
  local NC="\033[0m"
  local YELLOW="\033[0;33m"

  # homebrew
  echo -e "${YELLOW}Updating Homebrew formulae and casks...${NC}"
  brew update
  brew upgrade
  # avoid annoying `(latest) != latest` cask updates:
  # shellcheck disable=SC2046
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  # node, npm, yarn
  echo -e "${YELLOW}Updating global NPM/Yarn packages...${NC}"
  volta fetch node@latest  # pull latest non-LTS version but don't use it
  volta install node@lts
  volta install yarn@1
  volta run --node lts --no-yarn -- npm update --global
  volta run --node lts --yarn 1 -- yarn global upgrade

  # ruby, gems
  echo -e "${YELLOW}Updating Ruby and gems...${NC}"
  CONFIGURE_OPTS="$RUBY_CONFIGURE_OPTS" \
    rbenv install --skip-existing "$(rbenv install -l | grep -v - | tail -1)" && \
    rbenv global "$(rbenv install -l | grep -v - | tail -1)"
  gem install bundler foreman
  gem update
  gem cleanup
  rbenv rehash

  # pips
  # https://stackoverflow.com/a/3452888
  echo -e "${YELLOW}Updating pip packages...${NC}"
  pip3 list --outdated --format=json | jq -r '.[] | .name+"="+.latest_version' | cut -d = -f 1 | xargs -n1 pip3 install -U

  # App Store
  echo -e "${YELLOW}Checking for App Store updates...${NC}"
  mas outdated

  # macOS system
  echo -e "${YELLOW}Checking for macOS system updates...${NC}"
  softwareupdate --list

  # zinit & plugins
  echo -e "${YELLOW}Updating zinit...${NC}"
  zinit self-update
  zinit update --all
}

alias rehide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias unhide="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias force_empty="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"

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

# Xcode simulators
alias ios_sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias watchos_sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator\ \(Watch\).app"

# convenient access to public key
alias pubkey="pbcopy < ~/.ssh/id_ed25519.pub && echo '=> Public key copied to clipboard.'"
alias pubkey_rsa="pbcopy < ~/.ssh/id_rsa.pub && echo '=> Public key copied to clipboard.'"

# workaround for lack of tailscale CLI on mac:
# https://tailscale.com/kb/1080/cli/?tab=macos#using-the-cli
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
