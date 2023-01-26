###############################
#  Taps                       #
###############################
tap "1password/tap"
tap "dart-lang/dart"
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
tap "ngrok/ngrok"
tap "planetscale/tap"
tap "sass/sass"
tap "sidneys/homebrew"

###############################
#  Binaries                   #
###############################

# Perhaps most importantly...
brew "zsh" unless OS.linux?

# Better bash as a backup
brew "bash" unless OS.linux?

# GNU utilities (those that come with macOS are outdated)
brew "coreutils"
brew "findutils"
brew "gnu-indent"
brew "gnu-sed"
brew "gnu-tar"
brew "gnu-which"
brew "gnupg"
brew "gnutls"
brew "grep"
brew "make"
brew "moreutils"

# More recent versions of some macOS tools
brew "curl", link: true
brew "gcc"
brew "gmp"
brew "nano"
brew "openssh"
brew "screen"
brew "unzip", link: true
brew "vim"  #, args: ["with-override-system-vi"]

# Other useful binaries
brew "ack"
brew "autoconf"
brew "automake"
brew "ffmpeg"  #, args: ["with-libvpx"]
brew "imagemagick"  #, args: ["with-webp"]
brew "jemalloc"
brew "less"
brew "libsass", args: ["HEAD"]
brew "libyaml"
brew "mtr"
brew "openssl@1.1" if OS.mac?
brew "p7zip"
brew "pkg-config"
brew "readline"
brew "sidneys/homebrew/unrar" if OS.mac?
brew "ssh-copy-id", link: true
brew "tmux"
brew "tree"
brew "wget"  #, args: ["with-iri"]

# Git
brew "git"
brew "git-lfs"
brew "gh"

# Mostly ordinary binaries
brew "1password/tap/1password-cli" if OS.mac?
brew "angular-cli"
brew "asciinema"
brew "aws-shell"
brew "awscli"
brew "carthage"
brew "cocoapods"
brew "composer"
brew "dart-lang/dart/dart"
brew "deno"
brew "doctl"
brew "fx"
brew "go"
brew "guetzli"
brew "hashicorp/tap/packer"
brew "hashicorp/tap/terraform"
brew "hashicorp/tap/vault"
brew "htop"
brew "httpie"
brew "httrack"
brew "hugo", args: ["HEAD"]
brew "ipinfo-cli"
brew "iproute2mac"
brew "jq"
brew "mariadb"
brew "mas" if OS.mac?
brew "mhash"
brew "mkcert"
brew "mysql-client"
brew "ncurses"
brew "neofetch"
brew "netcat"
brew "openjdk"
brew "openvpn"
brew "optipng"
brew "pandoc"
brew "php"
brew "planetscale/tap/pscale"
brew "pngcrush"
brew "postgresql"
brew "protobuf"
brew "pyenv" unless OS.linux?
# brew "python"
# brew "python@3"
brew "qemu"
brew "rbenv" unless OS.linux?
brew "rclone"
brew "rlwrap"
brew "ruby-build" unless OS.linux?
# brew "ruby"
brew "rust"
brew "s3cmd"
brew "sass/sass/dart-sass-embedded"
brew "sass/sass/sass"
brew "serverless"
brew "shellcheck"
brew "shfmt"
brew "sqlite"
brew "subversion"
brew "svn"
brew "tor"
brew "torsocks"
brew "volta" unless OS.linux?
brew "whois", link: true
brew "wireguard-tools"
brew "wp-cli"
brew "xz"
# brew "youtube-dl"
brew "yq"
brew "yt-dlp"
brew "zopfli"

# Pentesting tools
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
cask "tailscale"
cask "tunnelblick"
cask "yubico-authenticator"
cask "yubico-yubikey-manager"

# Development/Work
cask "adobe-creative-cloud"
cask "android-platform-tools", args: { appdir: "~/Applications" }
cask "chromedriver"
cask "eclipse-java"
cask "github"
cask "google-cloud-sdk", args: { appdir: "~/Applications" }
cask "imageoptim"
cask "iterm2"
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
cask "parallels"
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

# Gaming
cask "steam"

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
cask "safari-technology-preview"
cask "tor-browser"

###############################
#  Drivers                    #
###############################

cask "homebrew/cask-drivers/hp-easy-start"
cask "homebrew/cask-drivers/logitech-camera-settings"
cask "homebrew/cask-drivers/logi-options-plus"
cask "homebrew/cask-drivers/logitech-unifying"
cask "homebrew/cask-drivers/razer-synapse"
cask "homebrew/cask-drivers/sonos"

###############################
#  Fonts                      #
###############################

# Monospace
cask "homebrew/cask-fonts/font-cascadia-code"
cask "homebrew/cask-fonts/font-hack"
cask "homebrew/cask-fonts/font-ibm-plex-mono"
cask "homebrew/cask-fonts/font-roboto-mono"
cask "homebrew/cask-fonts/font-sf-mono"
cask "homebrew/cask-fonts/font-sf-mono-for-powerline"
cask "homebrew/cask-fonts/font-source-code-pro"

# Sans/Serif
cask "homebrew/cask-fonts/font-comic-neue"
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
