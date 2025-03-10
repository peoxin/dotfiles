# MacOS

First, run this command to install CLT for Xcode.

```
xcode-select --install
```

## Homebrew

Install `homebrew`:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Setup mirror source for `homebrew`:

```
brew tap --custom-remote --force-auto-update homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
brew tap --custom-remote --force-auto-update homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
brew tap --custom-remote --force-auto-update homebrew/command-not-found https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
brew tap --custom-remote --force-auto-update homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git

brew update
```

Visit [Tuna Homebrew Help](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew) for more information.

## Fonts

```
brew tap homebrew/cask-fonts
brew install font-name
```
