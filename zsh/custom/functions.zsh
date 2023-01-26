#!/usr/bin/env zsh

# Make a new directory and `cd` right into it (this seems like a no-brainer)
mkcd() {
  mkdir -p -- "$1" &&
  cd -P -- "$1" || return
}

# Start an HTTP server from a directory, optionally specifying the port
serve() {
  local port="${1:-8090}"
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn't break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Extract a compressed archive without worrying about which tool to use
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2)
        tar xjf "$1"
        ;;
      *.tar.gz)
        tar xzf "$1"
        ;;
      *.bz2)
        bunzip2 "$1"
        ;;
      *.rar)
        unrar x "$1"
        ;;
      *.gz)
        gunzip "$1"
        ;;
      *.tar)
        tar xf "$1"
        ;;
      *.tbz2)
        tar xjf "$1"
        ;;
      *.tgz)
        tar xzf "$1"
        ;;
      *.zip)
        unzip "$1"
        ;;
      *.Z)
        uncompress "$1"
        ;;
      *.7z)
        7z x "$1"
        ;;
      *)
        echo "'$1' cannot be extracted via extract()"
        ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Create a git.io short URL (custom slug optional)
# ex: gitio https://github.com/jakejarvis/dotfiles [jakesdotfiles] => https://git.io/jakesdotfiles
# https://blog.github.com/2011-11-10-git-io-github-url-shortener
gitio() {
  local PARAMS RESPONSE
  PARAMS="-F \"url=$1\""
  if [[ -n "$2" ]]; then
    PARAMS="$PARAMS -F \"code=$2\""
  fi
  RESPONSE=$(eval "curl -i https://git.io $PARAMS 2>&1" | grep "Location: ")
  echo "${RESPONSE//Location: /}"
}

# Push a local SSH public key to another machine
# https://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc
push_ssh_cert() {
  local _host
  [[ -f ~/.ssh/id_ed25519.pub ]] || ssh-keygen -t ed25519
  for _host in "$@"; do
    echo "$_host"
    ssh "$_host" "\cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_ed25519.pub
  done
}
