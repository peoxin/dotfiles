First, run this command: `xcode-select --install` to install CLT for Xcode.

## Package Manager

Install `homebrew`:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

To configurate `homebrew`, refer to [Tuna Homebrew Help](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew).

Setup mirror source:

```
brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
brew tap --custom-remote --force-auto-update homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
brew tap --custom-remote --force-auto-update homebrew/command-not-found https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
brew tap --custom-remote --force-auto-update homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
brew update
```

## Fonts

```
brew tap homebrew/cask-fonts # Only need to do this once!
brew install font-name
```
