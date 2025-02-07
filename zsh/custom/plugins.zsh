#!/usr/bin/env zsh

# these custom values must be set *before* sourcing zinit
export ZINIT_HOME="${ZINIT_HOME:-"${XDG_DATA_HOME:-"${HOME}/.local/share"}/zinit/zinit.git"}"
declare -A ZINIT=(
  [ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-"$HOME/.cache"}/zsh/.zcompdump-$ZSH_VERSION"
)

# check for zinit
if [[ -f "$ZINIT_HOME/zinit.zsh" ]]; then
  source "$ZINIT_HOME/zinit.zsh"
else
  echo "zinit not found in '$ZINIT_HOME', either check the value of ZINIT_HOME or install zinit."
  return
fi

# initialize zinit && ensure compinit recognizes its completions
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# TODO: figure out why zinit stopped adding itself to MANPATH automatically...
if [[ -d "${ZINIT[MAN_DIR]}" ]]; then
  manpath=(
    "${ZINIT[MAN_DIR]}"
    $manpath
  )
fi

# various zinit add-ons
zinit light zdharma-continuum/zinit-annex-patch-dl

# oh-my-zsh was good at setting iTerm tab titles, keep doing it pls
# https://github.com/ohmyzsh/ohmyzsh/tree/master/lib
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/compfix.zsh

# async support
zinit ice lucid depth"1" \
  atload"async_init" \
  src"async.zsh"
zinit light mafredri/zsh-async

# grab exa (better ls) binary
zinit ice lucid from"gh-r" as"command" \
  mv"bin/exa* -> exa" \
  atclone"
    mv -vf completions/exa.zsh _exa
    mv -vf man/exa.1 ${ZINIT[MAN_DIR]}/man1
    mv -vf man/exa_colors.5 ${ZINIT[MAN_DIR]}/man5
  " \
  atpull"%atclone" \
  atload"
    alias ls='exa --color=auto -GF --icons --group-directories-first'
    alias ll='exa --color=auto -1laF --git --icons --group-directories-first --ignore-glob=\".DS_Store*|~*\"'
    alias lt='ll -T -L=2'
  "
zinit light ogham/exa

# grab bat (better cat) binary
zinit ice lucid from"gh-r" as"command" \
  mv"bat-*/bat -> bat" \
  atclone"
    mv -vf bat-*/autocomplete/bat.zsh _bat
    mv -vf bat-*/bat.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload"
    export BAT_THEME='base16'
    export MANPAGER='sh -c \"col -bx | bat --color=always --style=plain --language=man\"'
    alias cat='bat --paging=always --color=auto --style=numbers,changes'
    alias plcat='bat --paging=never --color=auto --style=plain'
  "
zinit light sharkdp/bat

# grab delta binary
zinit ice lucid from"gh-r" as"command" \
  mv"delta-*/delta -> delta" \
  dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta"
zinit light dandavison/delta

# grab fd binary
zinit ice lucid from"gh-r" as"command" \
  mv"fd-*/fd -> fd" \
  atclone"
    mv -vf fd-*/autocomplete/_fd _fd
    mv -vf fd-*/fd.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone"
zinit light sharkdp/fd

# grab fzf binary from release & other files from source
# TODO: preview commands are an absolute sh*tshow, maybe use .lessfilter?
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#show-file-contents
zinit ice lucid from"gh-r" as"command" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
  atload'
    export FZF_FD_OPTS="--color always --hidden --follow --exclude .git --exclude node_modules"
    export FZF_PREVIEW_FILE_COMMAND="bat --color=always --paging=never --style=plain"
    export FZF_PREVIEW_DIR_COMMAND="exa -1a --color=always --icons --group-directories-first"
    export FZF_DEFAULT_OPTS="--cycle --select-1 --exit-0 --height=60% --no-mouse --bind=\"tab:accept,ctrl-y:preview-page-up,ctrl-v:preview-page-down,ctrl-e:execute-silent(\${VISUAL:-\$EDITOR} {+} >/dev/null 2>&1)\""
    export FZF_DEFAULT_COMMAND="fd --type f $FZF_FD_OPTS"
    export FZF_ALT_C_OPTS="-i --ansi --preview=\"$FZF_PREVIEW_DIR_COMMAND {}\""
    export FZF_ALT_C_COMMAND="fd --type d . $FZF_FD_OPTS"
    export FZF_CTRL_T_OPTS="-i --ansi --bind=\"ctrl-w:execute(\$EDITOR {1} >/dev/tty </dev/tty)+refresh-preview\" --preview=\"$FZF_PREVIEW_FILE_COMMAND {} 2>/dev/null\""
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  ' \
  src"key-bindings.zsh"
zinit light junegunn/fzf

# zoxide
zinit ice wait"0b" lucid from"gh-r" as"command" \
  atclone"
    mv -vf man/man1/zoxide* ${ZINIT[MAN_DIR]}/man1
    ./zoxide init zsh > init.zsh
    zcompile init.zsh
  " \
  atpull"%atclone" \
  atinit'
    export _ZO_DATA_DIR="${XDG_DATA_HOME:-"$HOME/.local/share"}/zoxide"
    export _ZO_FZF_OPTS="$FZF_DEFAULT_OPTS --exact --no-sort --ansi --reverse --preview=\"$FZF_PREVIEW_DIR_COMMAND {2..}\""
  ' \
  src"init.zsh"
zinit light ajeetdsouza/zoxide

# grab vivid binary (for all the colors)
# https://github.com/sharkdp/vivid/tree/master/themes
# by outputting the generated LS_COLORS variable to a file and sourcing it, we only need to call vivid once on
# installation rather than every time a new session begins.
zinit ice lucid from"gh-r" as"command" \
  mv"vivid-*/vivid -> vivid" \
  atclone"
    ./vivid generate snazzy | xargs printf 'export LS_COLORS=%q' > colors.zsh
  " \
  atpull"%atclone" \
  atload"zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS}" \
  src"colors.zsh"
zinit light sharkdp/vivid

# better Ctrl+R history searching
zinit ice wait lucid depth"1" \
  atload"
    zstyle ':history-search-multi-word' highlight-color 'fg=yellow,bold'
    zstyle ':history-search-multi-word' page-size 15
    zstyle ':plugin:history-search-multi-word' active 'standout'
    zstyle ':plugin:history-search-multi-word' reset-prompt-protect 1
  " \
  trackbinds
zinit light zdharma-continuum/history-search-multi-word

# tab completions via fzf
zinit ice wait"0b" lucid depth"1" \
  has"fzf" \
  blockf \
  atpull"zinit creinstall -q ." \
  atload"
    zstyle ':completion:*' verbose true
    zstyle ':completion:*' use-cache true
    zstyle ':completion:*' cache-path '$(dirname ${ZINIT[ZCOMPDUMP_PATH]})/.zcompcache'
    zstyle ':completion:*' rehash true
    zstyle ':completion:*' squeeze-slashes true
    zstyle ':completion:*' list-dirs-first true
    zstyle ':completion:*' keep-prefix true
    zstyle ':completion:*' special-dirs true
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    zstyle ':completion:*' menu select
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
    zstyle ':completion:*:descriptions' format '%d'
    zstyle ':completion:*:functions' ignored-patterns '_*'
    zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?'
    zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?'
    zstyle ':completion::complete:rm:*:globbed-files' ignored-patterns
    zstyle ':fzf-tab:*' fzf-command 'fzf'
    zstyle ':fzf-tab:*' fzf-flags $FZF_DEFAULT_OPTS '-i' '--ansi'
    zstyle ':fzf-tab:*' fzf-bindings \
      'tab:accept' \
      'ctrl-y:preview-page-up' \
      'ctrl-v:preview-page-down' \
      'ctrl-e:execute-silent(\${VISUAL:-\$EDITOR} \$realpath >/dev/null 2>&1)' \
      'ctrl-w:execute(\$EDITOR \$realpath >/dev/tty </dev/tty)+refresh-preview'
    zstyle ':fzf-tab:*' fzf-min-height 15
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
      'git diff --no-ext-diff \$word | delta --paging=never --no-gitconfig --line-numbers --file-style=omit --hunk-header-style=omit --theme=base16'
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
      'git --no-pager log --color=always --format=oneline --abbrev-commit --follow \$word'
    zstyle ':fzf-tab:complete:man:*' fzf-preview \
      'man -P \"col -bx\" \$word | $FZF_PREVIEW_FILE_COMMAND --language=man'
    zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview \
      'brew info \$word'
    zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview \
      'echo \${(P)word}'
    zstyle ':fzf-tab:complete:*:options' fzf-preview
    zstyle ':fzf-tab:complete:*:options' fzf-flags '--no-preview'
    zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
    zstyle ':fzf-tab:complete:*:argument-1' fzf-flags '--no-preview'
    zstyle ':fzf-tab:complete:*:*' fzf-preview \
      '($FZF_PREVIEW_FILE_COMMAND \$realpath || $FZF_PREVIEW_DIR_COMMAND \$realpath) 2>/dev/null'
  "
zinit light Aloxaf/fzf-tab

# fix git-* completions, apparently there's some conflict with brew's git
# TODO: investigate more... https://github.com/Aloxaf/fzf-tab/wiki/Preview#git
zinit ice wait lucid as"null" \
  atload'zstyle ":completion:*:*:git:*" script "$(pwd)/git-completion.bash"'
zinit snippet https://github.com/git/git/raw/HEAD/contrib/completion/git-completion.bash

# grab completions as snippets from GitHub repos
zinit wait lucid as"completion" \
  atpull"zinit creinstall -q ." \
  nocompile \
  for \
    has"bundle"           https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_bundle \
    has"conda"            https://github.com/conda-incubator/conda-zsh-completion/raw/HEAD/_conda \
    has"docker"           https://github.com/docker/cli/raw/HEAD/contrib/completion/zsh/_docker \
    has"golang"           https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_golang \
    has"nano"             https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_nano \
    has"node"             https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_node \
    has"nvm"              https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_nvm \
    has"psql"             https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_pgsql_utils \
    has"rails"            https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_rails \
    has"rbenv"            https://github.com/rbenv/rbenv/raw/HEAD/completions/_rbenv \
    has"redis-cli"        https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_redis-cli \
    has"shellcheck"       https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_shellcheck \
    has"vagrant"          https://github.com/hashicorp/vagrant/raw/HEAD/contrib/zsh/_vagrant \
    has"yarn"             https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_yarn \
    has"git"    mv"git-completion.zsh -> _git"    https://github.com/git/git/raw/HEAD/contrib/completion/git-completion.zsh \
    has"pyenv"  mv"pyenv.zsh -> _pyenv"    https://github.com/pyenv/pyenv/raw/HEAD/completions/pyenv.zsh \
    if'[[ "$OSTYPE" = linux-gnu* ]]'  has"fail2ban-client"    https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_fail2ban-client \
    if'[[ "$OSTYPE" = linux-gnu* ]]'  has"ufw"                https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_ufw \
    if'[[ "$OSTYPE" = darwin* ]]'     has"security"           https://github.com/ohmyzsh/ohmyzsh/raw/HEAD/plugins/macos/_security \

# generate other completions from externally installed programs
zinit wait lucid as"completion" \
  atpull"zinit creinstall -q ." \
  nocompile \
  for \
    has"doctl"      id-as"_local/completions/doctl"       atclone"doctl completion zsh > _doctl"          zdharma-continuum/null \
    has"fnm"        id-as"_local/completions/fnm"         atclone"fnm completions --shell zsh > _fnm"            zdharma-continuum/null \
    has"gh"         id-as"_local/completions/gh"          atclone"gh completion -s zsh > _gh"             zdharma-continuum/null \
    has"glab"       id-as"_local/completions/glab"        atclone"glab completion -s zsh > _glab"         zdharma-continuum/null \
    has"helm"       id-as"_local/completions/helm"        atclone"helm completion zsh > _helm"           zdharma-continuum/null \
    has"hugo"       id-as"_local/completions/hugo"        atclone"hugo completion zsh > _hugo"            zdharma-continuum/null \
    has"kubectl"    id-as"_local/completions/kubectl"     atclone"kubectl completion zsh > _kubectl"      zdharma-continuum/null \
    has"minikube"   id-as"_local/completions/minikube"    atclone"minikube completion zsh > _minikube"    zdharma-continuum/null \
    has"ng"         id-as"_local/completions/ng"          atclone"ng completion script > _ng"             zdharma-continuum/null \
    has"op"         id-as"_local/completions/op"          atclone"op completion zsh > _op"                zdharma-continuum/null \
    has"pip"        id-as"_local/completions/pip"         atclone"pip completion --zsh > pip"             zdharma-continuum/null \
    has"pnpm"       id-as"_local/completions/pnpm"        atclone"pnpm completion zsh > _pnpm"            zdharma-continuum/null \
    has"pscale"     id-as"_local/completions/pscale"      atclone"pscale completion zsh > _pscale"        zdharma-continuum/null \
    has"rustup"     id-as"_local/completions/rustup"      atclone"rustup completions zsh > _rustup"       zdharma-continuum/null \
    has"supabase"   id-as"_local/completions/supabase"    atclone"supabase completion zsh > _supabase"    zdharma-continuum/null \
    has"tailscale"  id-as"_local/completions/tailscale"   atclone"tailscale completion zsh > _tailscale"  zdharma-continuum/null

# fix git-* completions, apparently there's some conflict with brew's git
# TODO: investigate more... https://github.com/Aloxaf/fzf-tab/wiki/Preview#git
zinit ice wait lucid as"null" \
  atload'zstyle ":completion:*:*:git:*" script "$(pwd)/git-completion.bash"'
zinit snippet https://github.com/git/git/raw/HEAD/contrib/completion/git-completion.bash

# macOS-only completion fixes
zinit ice wait lucid as"null" \
  id-as"_local/extra/mac" \
  if'[[ "$OSTYPE" = darwin* ]]' \
  atload"
    zstyle ':completion:*:*:*:*:processes' command 'ps -o comm=\"\" -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
      '[[ \$group == \"process ID\" ]] && ps -p\$word -o comm=\"\" -w -w'
  "
zinit light zdharma-continuum/null

# Linux-only completion fixes
zinit ice wait lucid as"null" \
  id-as"_local/extra/linux" \
  if'[[ "$OSTYPE" = linux-gnu* ]]' \
  atload"
    zstyle ':completion:*:*:*:*:processes' command 'ps -o cmd --no-headers -w -w'
    zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
      '[[ \$group == \"process ID\" ]] && ps --pid=\$word -o cmd --no-headers -w -w'
    zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status \$word'
  "
zinit light zdharma-continuum/null

# autopairing of quotes, brackets, etc.
zinit ice wait"0b" lucid depth"1" \
  atload"ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)"
zinit light hlissner/zsh-autopair

# syntax highlighting
zinit ice wait lucid depth"1" \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  atload"
    zle_highlight+=('paste:reverse')
    zstyle ':plugin:fast-syntax-highlighting' theme ''
    typeset -gA FAST_HIGHLIGHT_STYLES
    FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME:-}variable]='fg=cyan,bold'
  "
zinit light zdharma-continuum/fast-syntax-highlighting

# autosuggestions, trigger precmd hook upon load
zinit ice wait"0a" lucid depth"1" \
  atinit"
    export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
    export ZSH_AUTOSUGGEST_USE_ASYNC=1
  " \
  atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# 1Password plugins: https://developer.1password.com/docs/cli/shell-plugins/
# NOTE: this needs to happen *after* generating the completions above, otherwise it'll ask for touch ID to do very
# simple tasks...
zinit ice wait"1" lucid \
  id-as"_local/op-auth" \
  has"op" \
  if"[[ -f ~/.config/op/plugins.sh ]]" \
  nocompile
zinit snippet ~/.config/op/plugins.sh

# iTerm2 integration
zinit ice lucid depth"1" \
  if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
  atload'path=("$(pwd)/utilities" $path)' \
  src"shell_integration/zsh" \
  nocompile
zinit light gnachman/iTerm2-shell-integration

# starship prompt
zinit ice from"gh-r" as"command" \
  atclone"
    ./starship completions zsh > _starship
    ./starship init zsh --print-full-init > init.zsh
    zcompile init.zsh
  " \
  atpull"%atclone" \
  src"init.zsh"
zinit light starship/starship
