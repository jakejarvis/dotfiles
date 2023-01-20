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
  atload"alias cat='bat --paging=never --color=auto --style=\"numbers,changes\" --theme=\"Dracula\"'"
zinit light sharkdp/bat

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
    FZF_PREVIEW_FILE_COMMAND="bat --color=always --paging=never --style=plain --theme=Dracula"
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
  dl"https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -> key-bindings.zsh" \
  dl"https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -> _fzf" \
  dl"https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf.1 -> ${ZINIT[MAN_DIR]}/man1/fzf.1" \
  dl"https://raw.githubusercontent.com/junegunn/fzf/master/man/man1/fzf-tmux.1 -> ${ZINIT[MAN_DIR]}/man1/fzf-tmux.1" \
  src"key-bindings.zsh"
zinit light junegunn/fzf

# all the colors
# https://github.com/sharkdp/vivid/tree/master/themes
# shellcheck disable=SC2016
zinit ice from"gh-r" as"command" \
  mv"vivid-*/vivid -> vivid" \
  atload'export LS_COLORS="$(vivid generate snazzy)"'
zinit load sharkdp/vivid

# direnv
zinit ice from"gh-r" as"command" \
  mv"direnv* -> direnv" \
  atclone"./direnv hook zsh > zhook.zsh" \
  atpull"%atclone" \
  src"zhook.zsh"
zinit light direnv/direnv

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
# TODO: fix git-* completions, apparently there's some conflict with brew's git
# https://github.com/Aloxaf/fzf-tab/wiki/Preview#git
zinit ice wait lucid \
  atload"
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS}
    zstyle ':completion:*:descriptions' format '[%d]'
    zstyle ':completion::complete:*:*:files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
    zstyle ':completion::complete:*:*:globbed-files' ignored-patterns '.DS_Store' 'Icon?' '.Trash'
    zstyle ':completion::complete:rm:*:globbed-files' ignored-patterns
    zstyle ':fzf-tab:*' fzf-command fzf
    zstyle ':fzf-tab:*' fzf-bindings \
      'tab:accept' \
      'ctrl-y:preview-page-up' \
      'ctrl-v:preview-page-down' \
      'ctrl-e:execute-silent(${VISUAL:-code} \${realpath:-\$word} >/dev/null 2>&1)' \
      'ctrl-w:execute(${EDITOR:-nano} \${realpath:-\$word} >/dev/tty </dev/tty)+refresh-preview'
    zstyle ':fzf-tab:*' fzf-min-height 15
    zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
      'git --no-pager diff --color=always --no-ext-diff \${realpath:-\$word} | delta'
    zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
      'git --no-pager log --color=always --format=oneline --abbrev-commit --follow \${realpath:-\$word}'
    zstyle ':fzf-tab:complete:man:*' fzf-preview \
      'man \$word'
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

# autosuggestions, trigger precmd hook upon load
zinit ice wait lucid \
  atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# additional completions
zinit ice wait lucid blockf as"completion" \
  atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

# syntax highlighting
zinit ice wait lucid \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zinit light zsh-users/zsh-syntax-highlighting

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

# 1Password plugins: https://developer.1password.com/docs/cli/shell-plugins/
zinit ice \
  if"command -v op &>/dev/null" \
  atclone"op completion zsh > _op || true"
zinit snippet ~/.config/op/plugins.sh

# starship prompt
zinit ice from"gh-r" as"command" \
  atclone"
    ./starship init zsh > init.zsh
    ./starship completions zsh > _starship
  " \
  atpull"%atclone" \
  src"init.zsh"
zinit light starship/starship
