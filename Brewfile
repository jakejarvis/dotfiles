###############################
#  Taps                       #
###############################
tap "1password/tap"
tap "dart-lang/dart"
tap "dopplerhq/cli"
tap "hashicorp/tap"
tap "homebrew/aliases"
tap "homebrew/autoupdate"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"
tap "microsoft/git"
tap "ngrok/ngrok"
tap "planetscale/tap"
tap "sass/sass"

###############################
#  Formulae                   #
###############################

# perhaps most importantly...
brew "zsh" unless OS.linux?

# modern bash as a backup
brew "bash" unless OS.linux?

# correct Apple's GPL stubbornness...
brew "coreutils" if OS.mac?
brew "findutils" if OS.mac?
brew "gnu-sed"
brew "gnu-tar"
brew "gnu-which"
brew "gnupg" if OS.mac?
brew "gnutls"
brew "grep"
brew "make"

# more recent versions of some other macOS tools/libraries
brew "bzip2", link: true
brew "curl", link: true
brew "gcc"
brew "icu4c"
brew "less"
brew "libffi"
brew "libxml2"
brew "nano"
brew "ncurses"
brew "openssh" unless OS.linux?
brew "openssl@1.1" if OS.mac?
brew "readline"
brew "screen"
brew "sqlite"
brew "tcl-tk"
brew "unzip", link: true
brew "vim"  #, args: ["with-override-system-vi"]
brew "wget"  #, args: ["with-iri"]
brew "whois", link: true
brew "zlib"

# common binaries/libraries
brew "ffmpeg"  #, args: ["with-libvpx"]
brew "fx"
brew "gettext"
brew "groff"
brew "guetzli"
brew "htop" if OS.mac?
brew "hyperfine"
brew "imagemagick"  #, args: ["with-webp"]
brew "jemalloc"
brew "jq"
brew "libsass", args: ["HEAD"]
brew "libyaml"
brew "mhash"
brew "mtr"
brew "p7zip"
brew "pkg-config"
brew "protobuf"
brew "rlwrap"
brew "rsync"
brew "tmux"
brew "tree"
brew "webp"
brew "xz"
brew "yq"
brew "zopfli"

# Git (and GitHub/GitLab CLIs)
brew "git"
brew "git-lfs"
brew "gh"
brew "glab"

# mostly development stuff
brew "1password/tap/1password-cli" if OS.mac?
brew "asciinema"
brew "aws-shell"
brew "awscli"
brew "carthage" if OS.mac?
brew "cocoapods" if OS.mac?
brew "composer"
brew "croc"
brew "dart-lang/dart/dart"
brew "deno"
brew "dive"
brew "doctl"
brew "dopplerhq/cli/doppler"
brew "fnm"
brew "go"
brew "hashicorp/tap/packer"
brew "hashicorp/tap/terraform"
brew "hashicorp/tap/vault"
brew "httpie"
brew "httrack"
brew "hugo", args: ["HEAD"]
brew "iproute2mac" if OS.mac?
brew "mariadb" unless OS.linux?
brew "mas" if OS.mac?
brew "mkcert"
brew "mysql-client" unless OS.linux?
brew "neofetch"
brew "neonctl"
brew "netcat"
brew "openjdk", link: true
brew "openvpn"
brew "pandoc"
brew "php" unless OS.linux?
brew "planetscale/tap/pscale"
brew "postgresql" unless OS.linux?
brew "pyenv"
brew "pyenv-virtualenv"
# brew "python"
# brew "python@2"
brew "qemu"
brew "rbenv"
# brew "ruby"
brew "ruby-build"
brew "rust"
brew "s3cmd"
brew "sass/sass/dart-sass-embedded"
brew "sass/sass/sass"
brew "shellcheck"
brew "tea"
brew "tor"
brew "torsocks"
brew "wp-cli"
# brew "youtube-dl"
brew "yt-dlp"

# infosec & pentesting
brew "aircrack-ng"
brew "apktool"
brew "bettercap"
brew "binutils"
brew "binwalk"
brew "dnsx"
brew "fcrackzip"
brew "geoip"
brew "hashcat"
brew "httpx"
brew "hydra"
brew "ipinfo-cli"
brew "john"
brew "knock"
brew "massdns"
brew "mitmproxy"
brew "naabu"
brew "nikto"
brew "nmap"
brew "nuclei"
brew "pdfcrack"
brew "pngcheck"
brew "sqlmap"
brew "subfinder"
brew "tcpdump"
brew "tcpflow"
brew "tcpreplay"
brew "tcptrace"
brew "vbindiff"

###############################
#  macOS Apps via Cask        #
###############################

cask_args appdir: "/Applications"

# System Utilities
cask "airbuddy"
cask "appcleaner"
cask "backblaze"
cask "carbon-copy-cloner"
cask "cleanmymac"
cask "coconutbattery"
cask "daisydisk"
cask "dropbox"
cask "etrecheckpro"
cask "geekbench"
cask "istat-menus"
cask "macupdater"
cask "the-unarchiver"
cask "transmission"
cask "vnc-viewer"

# Passwords, VPNs, other Security
cask "1password"
cask "authy"
cask "gpg-suite"
cask "little-snitch"
# cask "microsoft/git/git-credential-manager-core"
cask "tailscale"
cask "tunnelblick"

# Development/Work
cask "adobe-creative-cloud"
cask "android-platform-tools", args: { appdir: "~/Applications" }
cask "chromedriver"
cask "eclipse-java"
cask "github"
cask "google-cloud-sdk", args: { appdir: "~/Applications" }
cask "imageoptim"
# cask "iterm2"
cask "iterm2-beta"
cask "jetbrains-toolbox"
cask "microsoft-office"
cask "ngrok/ngrok/ngrok"
cask "sequel-pro"
cask "sketch"
cask "tableplus"
cask "thunderbird"
cask "transmit"
cask "visual-studio-code"

# Virtual Machines (& Docker)
cask "docker"
# cask "multipass"
cask "parallels"
cask "vagrant"
# cask "virtualbox"
cask "virtualbox-beta"  # supports M1!

# Media
cask "beamer"
cask "handbrake"
cask "iina"
cask "obs"
cask "plex-media-player"
cask "pocket-casts"
cask "spotify"

# Communication/Social
cask "discord"
cask "skype"
cask "slack"
cask "zoomus"

# Pentesting
cask "burp-suite"
cask "charles"
cask "metasploit"
cask "wifi-explorer"
cask "wireshark"

# Browsers
cask "firefox"
cask "firefox-developer-edition"
cask "google-chrome"
cask "tor-browser"

###############################
#  Drivers                    #
###############################

cask "homebrew/cask-drivers/logi-options-plus"
cask "homebrew/cask-drivers/philips-hue-sync"
cask "homebrew/cask-drivers/sonos"
cask "homebrew/cask-drivers/yubico-authenticator"
cask "homebrew/cask-drivers/yubico-yubikey-manager"

###############################
#  Fonts                      #
###############################

# Monospace
cask "homebrew/cask-fonts/font-cascadia-code"
cask "homebrew/cask-fonts/font-hack"
cask "homebrew/cask-fonts/font-roboto-mono"
cask "homebrew/cask-fonts/font-sf-mono"
cask "homebrew/cask-fonts/font-sf-mono-for-powerline"
cask "homebrew/cask-fonts/font-source-code-pro"

# Sans/Serif
cask "homebrew/cask-fonts/font-inter"
cask "homebrew/cask-fonts/font-open-sans"
cask "homebrew/cask-fonts/font-roboto"
cask "homebrew/cask-fonts/font-sf-compact"
cask "homebrew/cask-fonts/font-sf-pro"

###############################
#  macOS Apps via App Store   #
###############################

# Apple
mas "Apple Configurator 2", id: 1037126344
mas "Compressor", id: 424390742
mas "Developer", id: 640199958
mas "Final Cut Pro", id: 424389933
mas "GarageBand", id: 682658836
mas "iMovie", id: 408981434
mas "Keynote", id: 409183694
mas "Logic Pro", id: 634148309
mas "Motion", id: 434290957
mas "Numbers", id: 409203825
mas "Pages", id: 409201541
mas "TestFlight", id: 899247664
mas "Transporter", id: 1450874784
mas "Xcode", id: 497799835

# Third Party
mas "1Blocker", id: 1365531024
mas "1Password for Safari", id: 1569813296
mas "Amphetamine", id: 937984704
mas "Drafts", id: 1435957248
mas "Magnet", id: 441258766
mas "Microsoft Remote Desktop", id: 1295203466
mas "Shazam", id: 897118787
mas "Silicon Info", id: 1542271266
mas "Speedtest", id: 1153157709
mas "VMware Remote Console", id: 1230249825
mas "WireGuard", id: 1451685025
