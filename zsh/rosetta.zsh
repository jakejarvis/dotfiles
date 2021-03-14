# Set iTerm color scheme to Intel blue when session running via Rosetta2
# https://cutecoder.org/software/detecting-apple-silicon-shell-script/
if [[ "$(uname -m)" == "x86_64" && "$(sysctl -in sysctl.proc_translated)" == "1" ]]; then
  ARCH_BG="003862"  # Intel-ish blue
else
  ARCH_BG="0B0B0B"  # boring black
fi

# https://iterm2.com/documentation-escape-codes.html
echo -ne "\033]1337;SetColors=bg=${ARCH_BG}\007"
