# dotfiles

## picom

配置文件路径：`~/.config/picom/picom.conf`

运行`picom`：`picom --config ~/.config/picom/picom.conf`

## zsh

首先安装`ohmyzsh`：

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

下载插件：

```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

配置文件路径：`~/.zshrc`
