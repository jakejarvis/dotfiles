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

# Create a git.io short URL (custom slug optional)
# ex: gitio https://github.com/jakejarvis/dotfiles [jakesdotfiles] => https://git.io/jakesdotfiles
# https://blog.github.com/2011-11-10-git-io-github-url-shortener
gitio() {
  PARAMS="-F \"url=$1\""
  if [ -n "$2" ]; then PARAMS="$PARAMS -F \"code=$2\""; fi
  RESPONSE=$(eval "curl -i https://git.io $PARAMS 2>&1" | grep "Location: ")
  echo "${RESPONSE//Location: /}"
}

# Push a local SSH public key to another machine
# https://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc
push_ssh_cert() {
  local _host
  test -f ~/.ssh/id_ed25519.pub || ssh-keygen -t ed25519
  for _host in "$@";
  do
    echo $_host
    ssh $_host 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_ed25519.pub
  done
}

# upload file(s) to https://transfer.sh
# https://github.com/dutchcoders/transfer.sh#bash-and-zsh-with-delete-url-delete-token-output-and-prompt-before-uploading
transfer()
{
  local file
  declare -a file_array
  file_array=("${@}")

  if [[ "${file_array[@]}" == "" || "${1}" == "--help" || "${1}" == "-h" ]]
  then
    echo "${0} - Upload arbitrary files to \"transfer.sh\"."
    echo ""
    echo "Usage: ${0} [options] [<file>]..."
    echo ""
    echo "OPTIONS:"
    echo "  -h, --help"
    echo "      show this message"
    echo ""
    echo "EXAMPLES:"
    echo "  Upload a single file from the current working directory:"
    echo "      ${0} \"image.img\""
    echo ""
    echo "  Upload multiple files from the current working directory:"
    echo "      ${0} \"image.img\" \"image2.img\""
    echo ""
    echo "  Upload a file from a different directory:"
    echo "      ${0} \"/tmp/some_file\""
    echo ""
    echo "  Upload all files from the current working directory. Be aware of the webserver's rate limiting!:"
    echo "      ${0} *"
    echo ""
    echo "  Upload a single file from the current working directory and filter out the delete token and download link:"
    echo "      ${0} \"image.img\" | awk --field-separator=\": \" '/Delete token:/ { print \$2 } /Download link:/ { print \$2 }'"
    echo ""
    echo "  Show help text from \"transfer.sh\":"
    echo "      curl --request GET \"https://transfer.sh\""
    return 0
  else
    for file in "${file_array[@]}"
    do
      if [[ ! -f "${file}" ]]
      then
        echo -e "\e[01;31m'${file}' could not be found or is not a file.\e[0m" >&2
        return 1
      fi
    done
    unset file
  fi

  local upload_files
  local curl_output
  local awk_output

  du --total --block-size="K" --dereference "${file_array[@]}" >&2
  # be compatible with "bash"
  if [[ "${ZSH_NAME}" == "zsh" ]]
  then
    read $'upload_files?\e[01;31mDo you really want to upload the above files ('"${#file_array[@]}"$') to "transfer.sh"? (Y/n): \e[0m'
  elif [[ "${BASH}" == *"bash"* ]]
  then
    read -p $'\e[01;31mDo you really want to upload the above files ('"${#file_array[@]}"$') to "transfer.sh"? (Y/n): \e[0m' upload_files
  fi

  case "${upload_files:-y}" in
    "y"|"Y")
      # for the sake of the progress bar, execute "curl" for each file.
      # the parameters "--include" and "--form" will suppress the progress bar.
      for file in "${file_array[@]}"
      do
        # show delete link and filter out the delete token from the response header after upload.
        # it is important to save "curl's" "stdout" via a subshell to a variable or redirect it to another command,
        # which just redirects to "stdout" in order to have a sane output afterwards.
        # the progress bar is redirected to "stderr" and is only displayed,
        # if "stdout" is redirected to something; e.g. ">/dev/null", "tee /dev/null" or "| <some_command>".
        # the response header is redirected to "stdout", so redirecting "stdout" to "/dev/null" does not make any sense.
        # redirecting "curl's" "stderr" to "stdout" ("2>&1") will suppress the progress bar.
        curl_output=$(curl --request PUT --progress-bar --dump-header - --upload-file "${file}" "https://transfer.sh/")
        awk_output=$(awk \
          'gsub("\r", "", $0) && tolower($1) ~ /x-url-delete/ \
          {
            delete_link=$2;
            print "Delete command: curl --request DELETE " "\""delete_link"\"";

            gsub(".*/", "", delete_link);
            delete_token=delete_link;
            print "Delete token: " delete_token;
          }

          END{
            print "Download link: " $0;
          }' <<< "${curl_output}")

        # return the results via "stdout", "awk" does not do this for some reason.
        echo -e "${awk_output}\n"

        # avoid rate limiting as much as possible; nginx: too many requests.
        if (( ${#file_array[@]} > 4 ))
        then
          sleep 5
        fi
      done
      ;;

    "n"|"N")
      return 1
      ;;

    *)
      echo -e "\e[01;31mWrong input: '${upload_files}'.\e[0m" >&2
      return 1
  esac
}
