# Make a new directory and `cd` right into it (this seems like a no-brainer)
mkcd() {
  mkdir -p -- "$1" &&
  cd -P -- "$1"
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
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find the real location of a short URL
unshort() {
  curl -sIL $1 | sed -n 's/Location: *//p'
}

# Create a git.io short URL (custom slug optional)
# ex: gitio https://github.com/jakejarvis/dotfiles [jakesdotfiles] => https://git.io/jakesdotfiles
# https://blog.github.com/2011-11-10-git-io-github-url-shortener
gitio() {
  PARAMS="-F \"url=$1\""
  if [ -n "$2" ]; then PARAMS="$PARAMS -F \"code=$2\""; fi
  RESPONSE=$(eval "curl -i https://git.io $PARAMS 2>&1" | grep "Location: ")
  echo "${RESPONSE//Location: /}"
}

# Transfers text file as sharable link.
# See https://transfer.sh/
transfer() {
  if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
  tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile;
}

# List files in an S3 bucket
s3ls() {
  aws s3 ls s3://$1
}

# Push a local SSH public key to another machine
# https://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc
push_ssh_cert() {
  local _host
  test -f ~/.ssh/id_rsa.pub || ssh-keygen -t rsa
  for _host in "$@";
  do
    echo $_host
    ssh $_host 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_rsa.pub
  done
}
