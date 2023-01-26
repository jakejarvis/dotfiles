#!/usr/bin/env zsh

# check for zinit and clone if not installed
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# initialize zinit
# shellcheck disable=SC1091
source "$ZINIT_HOME/zinit.zsh"

# ensure compinit recognizes zinit's changes
autoload -Uz _zinit
# shellcheck disable=SC2154
(( ${+_comps} )) && _comps[zinit]=_zinit

# various zinit add-ons
zinit light zdharma-continuum/zinit-annex-patch-dl

# async support
zinit ice wait lucid \
  atload"async_init" \
  src"async.zsh"
zinit light mafredri/zsh-async

# z
zinit ice wait lucid blockf \
  atclone"
    mv -vf z.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload"_Z_DATA=~/.zdata" \
  src"z.sh"
zinit light rupa/z

# grab exa (better ls) binary
zinit ice from"gh-r" as"command" \
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
zinit ice from"gh-r" as"command" \
  mv"bat-*/bat -> bat" \
  atclone"
    mv -vf bat-*/autocomplete/bat.zsh _bat
    mv -vf bat-*/bat.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload"
    export BAT_THEME='base16'
    export BAT_PAGER='less -R -F -+X --mouse'
    export MANPAGER='sh -c \"col -bx | bat --color=always --style=plain --language=man\"'
    alias cat='bat --paging=never --color=auto --style=numbers,changes'
    alias cats='bat --paging=always --color=always --style=numbers,changes'
    alias catcat='\cat --paging=never --color=auto --style=plain'
  "
zinit light sharkdp/bat

# grab delta binary
zinit ice from"gh-r" as"command" \
  mv"delta-*/delta -> delta" \
  dl"https://github.com/dandavison/delta/raw/HEAD/etc/completion/completion.zsh -> _delta" \
  atload"
    # https://dandavison.github.io/delta/mouse-scrolling.html
    export DELTA_PAGER='less -R -F -+X --mouse'
  "
zinit light dandavison/delta

# grab fd binary
# TODO: preview commands are an absolute sh*tshow, maybe use .lessfilter?
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#show-file-contents
# shellcheck disable=SC2016
zinit ice from"gh-r" as"command" \
  mv"fd-*/fd -> fd" \
  atclone"
    mv -vf fd-*/autocomplete/_fd _fd
    mv -vf fd-*/fd.1 ${ZINIT[MAN_DIR]}/man1
  " \
  atpull"%atclone" \
  atload'
    FZF_FD_OPTS="--color always --hidden --follow --exclude .git --exclude node_modules"
    FZF_PREVIEW_FILE_COMMAND="bat --color=always --paging=never --style=plain"
    FZF_PREVIEW_DIR_COMMAND="exa -1a --color=always --icons --group-directories-first"
    FZF_DEFAULT_OPTS="--no-mouse --bind \"tab:accept,ctrl-y:preview-page-up,ctrl-v:preview-page-down,ctrl-e:execute-silent(\${VISUAL:-code} {+} >/dev/null 2>&1)\""
    FZF_DEFAULT_COMMAND="fd --type f $FZF_FD_OPTS"
    FZF_ALT_C_OPTS="--ansi --preview \"$FZF_PREVIEW_DIR_COMMAND {} 2>/dev/null\""
    FZF_ALT_C_COMMAND="fd --type d . $FZF_FD_OPTS"
    FZF_CTRL_T_OPTS="--ansi --bind \"ctrl-w:execute(\${EDITOR:-nano} {1} >/dev/tty </dev/tty)+refresh-preview\" --preview \"$FZF_PREVIEW_FILE_COMMAND {} 2>/dev/null\""
    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  '
zinit light sharkdp/fd

# grab fzf binary from release & other files from source
zinit ice from"gh-r" as"command" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/key-bindings.zsh -> key-bindings.zsh" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/shell/completion.zsh -> _fzf" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
  dl"https://github.com/junegunn/fzf/raw/HEAD/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
  src"key-bindings.zsh"
zinit light junegunn/fzf

# grab vivid binary (for all the colors)
# https://github.com/sharkdp/vivid/tree/master/themes
# shellcheck disable=SC2016
zinit ice from"gh-r" as"command" \
  mv"vivid-*/vivid -> vivid" \
  atload'export LS_COLORS="$(vivid generate snazzy)"'
zinit load sharkdp/vivid

# history substring searching
# only bind these keys once they're ready
bindkey -r "^[[A"
bindkey -r "^[[B"
zinit ice wait lucid \
  atload"
    zmodload zsh/terminfo
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  "
zinit light zsh-users/zsh-history-substring-search

# tab completions via fzf
zinit ice wait"1" lucid \
  has"fzf" \
  atload"
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS}
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
    zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
    zstyle ':completion::complete:rm:*:globbed-files' ignored-patterns
    zstyle ':fzf-tab:*' fzf-command fzf
    zstyle ':fzf-tab:*' fzf-flags '--ansi'
    zstyle ':fzf-tab:*' fzf-bindings \
      'tab:accept' \
      'ctrl-y:preview-page-up' \
      'ctrl-v:preview-page-down' \
      'ctrl-e:execute-silent(\${VISUAL:-code} \$realpath >/dev/null 2>&1)' \
      'ctrl-w:execute(\${EDITOR:-nano} \$realpath >/dev/tty </dev/tty)+refresh-preview'
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

# TODO: fix git-* completions, apparently there's some conflict with brew's git
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#git
# shellcheck disable=SC2016
zinit ice wait lucid as"completions" \
  id-as"git-completions" \
  has"git" \
  dl"https://github.com/git/git/raw/HEAD/contrib/completion/git-completion.zsh -> _git" \
  dl"https://github.com/git/git/raw/HEAD/contrib/completion/git-completion.bash -> git-completion.bash" \
  atpull"zinit creinstall -q ." \
  atload'
    zstyle ":completion:*:*:git:*" script "$PWD/git-completion.bash"
  ' \
  nocompile
zinit light zdharma-continuum/null

# use zinit to track completions from non-zinit programs
zinit ice wait lucid blockf as"completions" \
  id-as"local-completions" \
  dl"https://github.com/docker/cli/raw/HEAD/contrib/completion/zsh/_docker -> _docker" \
  dl"https://github.com/docker/compose/raw/master/contrib/completion/zsh/_docker-compose -> _docker-compose" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_node -> _node" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_yarn -> _yarn" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_bundle -> _bundle" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_rails -> _rails" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_golang -> _golang" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_shellcheck -> _shellcheck" \
  dl"https://github.com/zsh-users/zsh-completions/raw/HEAD/src/_httpie -> _httpie" \
  dl"https://github.com/rbenv/rbenv/raw/HEAD/completions/rbenv.zsh -> _rbenv" \
  dl"https://github.com/pyenv/pyenv/raw/HEAD/completions/pyenv.zsh -> _pyenv" \
  atclone"
    command -v volta &>/dev/null && volta completions zsh > _volta || true
    command -v npm &>/dev/null && npm completion > _npm || true
    command -v gh &>/dev/null && gh completion -s zsh > _gh || true
    command -v op &>/dev/null && op completion zsh > _op || true
    command -v hugo &>/dev/null && hugo completion zsh > _hugo || true
  " \
  atpull"zinit creinstall -q ." \
  nocompile
zinit light zdharma-continuum/null

# additional completions
# zinit ice wait lucid blockf as"completion" \
#   atpull"zinit creinstall -q ."
# zinit light zsh-users/zsh-completions

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid \
  atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# syntax highlighting
zinit ice wait lucid \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

# 1Password plugins: https://developer.1password.com/docs/cli/shell-plugins/
zinit ice wait lucid \
  id-as"op-plugins" \
  has"op" \
  if"[[ -f ~/.config/op/plugins.sh ]]"
zinit snippet ~/.config/op/plugins.sh

# oh-my-zsh leftovers
# https://github.com/ohmyzsh/ohmyzsh/tree/master/lib
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/termsupport.zsh

# iTerm2 integration
# shellcheck disable=SC2016
zinit ice lucid \
  if'[[ "$TERM_PROGRAM" = "iTerm.app" ]]' \
  pick"shell_integration/zsh" \
  sbin"utilities/*"
zinit light gnachman/iTerm2-shell-integration

# starship prompt
zinit ice from"gh-r" as"command" \
  atclone"
    ./starship init zsh --print-full-init > init.zsh
    ./starship completions zsh > _starship
  " \
  atpull"%atclone" \
  src"init.zsh"
zinit light starship/starship
