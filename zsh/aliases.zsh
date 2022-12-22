# Enable aliases to be sudo'ed
alias sudo="sudo "

# restore colors to GNU ls
alias ls="ls -G --color=tty"
alias ll="ls -lah"
alias la="ls -a"
alias l="ls -lh"

# typos
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

# Git
alias g="git"
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
alias github="gh repo view --web"
alias gist="gh gist create --web"
glall() {
  # pull all remote branches
  # https://stackoverflow.com/a/10312587
  for remote in `git branch -r`; do git branch --track ${remote#origin/} $remote; done
  git fetch --all
  git pull --all
}

# Docker
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

# Node/NPM/Yarn
alias npr="npm run"
alias fresh_npm="rm -rf node_modules package-lock.json && npm install"
alias fresh_yarn="rm -rf node_modules yarn.lock && yarn install"

# Hugo
make_hugo() {
  # parentheses lets us cd to Hugo path without changing our current location
  (
    cd "$GOPATH/src/github.com/gohugoio/hugo" \
    && /bin/bash -c "$GOPATH/bin/hugo env" \
    && git checkout master \
    && mage uninstall \
    && git pull origin master \
    && git reset --hard HEAD \
    && mage -v hugo \
    && HUGO_BUILD_TAGS=extended mage -v install \
    && /bin/bash -c "$GOPATH/bin/hugo env"
  )
}
alias hugo_brew="brew upgrade hugo --fetch-HEAD --build-from-source"
# run `hugo config` first to make sure we're in a Hugo directory:
alias hugo_clean="hugo config 1>/dev/null && rm -rf public/ resources/ build/"

# SSH
alias sshalt="ssh -p 2222"
alias moshalt="mosh --ssh=\"ssh -p 2222\""
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to clipboard.'"
alias pubkey_rsa="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

# youtube-dl
alias ytdl="youtube-dl -f bestvideo+bestaudio"
alias ytmp3="youtube-dl -f bestaudio -x --audio-format mp3 --audio-quality 320K"

# fun
alias weather="curl 'https://wttr.in/?format=v2'"
