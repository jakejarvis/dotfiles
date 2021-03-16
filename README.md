# My .files 🏡

[![Lint](https://github.com/jakejarvis/dotfiles/workflows/Lint/badge.svg)](https://github.com/jakejarvis/dotfiles/actions) [![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=jakejarvis/dotfiles)](https://dependabot.com)

Just a personal backup of my MacBook Pro's setup. Certainly not a drop-in solution for anybody's machine except my own, but maybe a few lines will prove useful to you. 

(...in other words, after stealing so many sick bash hacks from people on here who are much smarter than me, I felt obligated to keep the repo public. And in even more words, **_use the automated scripts at your own risk!_**)

All of the juicy stuff you're probably looking for is in [`zsh/aliases.zsh`](zsh/aliases.zsh) and [`zsh/functions.zsh`](zsh/functions.zsh) for my ZSH hacks, [`macos/defaults.sh`](macos/defaults.sh) for my macOS defaults, and [`Brewfile`](Brewfile) for my far-too-long list of binaries and apps I "need" installed. My [Firefox preferences](firefox/user.js) and [VS Code settings](vscode/) also live here. Also see my [**/uses page** for more details](https://jarv.is/uses/).

Thanks for visiting, the `exit` is that way!

❤️ [Jake](https://jarv.is/)

## Usage

Designed for macOS, kinda works on Linux (requires [ZSH to be installed](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#ubuntu-debian--derivatives-windows-10-wsl--native-linux-kernel-with-windows-10-build-1903) first):

```bash
git clone --recurse-submodules https://github.com/jakejarvis/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

or:

```bash
curl -sL jrvs.io/bootstrap | bash    # probably don't do this if you're not me
```

## License

This project is distributed under the [MIT license](LICENSE.md).
