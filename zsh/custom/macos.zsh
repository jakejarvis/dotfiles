#!/usr/bin/env zsh

export BROWSER="/Applications/Firefox.app/Contents/MacOS/firefox"

# https://developer.1password.com/docs/ssh/get-started#step-4-configure-your-ssh-or-git-client
if [[ -S "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]]; then
  export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"  # --require-sha
export HOMEBREW_FORCE_BREWED_CURL=1
export HOMEBREW_FORCE_BREWED_GIT=1

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
  brew upgrade $(brew outdated --greedy --verbose | awk '$2 !~ /(latest)/ {print $1}')
  brew cleanup

  # node, npm, yarn
  echo -e "${YELLOW}Updating global NPM/Yarn packages...${NC}"
  fnm install --latest --corepack-enabled
  npm update --global --no-audit

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

  # zinit & plugins
  echo -e "${YELLOW}Updating zinit...${NC}"
  zinit self-update
  zinit update --all

  # App Store
  echo -e "${YELLOW}Checking for App Store updates...${NC}"
  mas outdated

  # macOS system
  echo -e "${YELLOW}Checking for macOS system updates...${NC}"
  softwareupdate --list
}

alias unhidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias rehidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias force_empty="sudo rm -rf ~/.Trash /Volumes/*/.Trashes"
alias unq="sudo xattr -rd com.apple.quarantine"

# hide/show all desktop icons (useful when presenting)
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

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

# convenient access to ssh public key
alias pubkey="pbcopy < ~/.ssh/id_ed25519.pub && echo '=> Public key copied to clipboard.'"

# workaround for lack of tailscale CLI on mac:
# https://tailscale.com/kb/1080/cli/?tab=macos#using-the-cli
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
