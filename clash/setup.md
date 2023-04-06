## Setup

```
sudo pacman -S clash
mkdir ~/.config/clash
curl -o ~/.config/clash/Country.mmdb http://www.ideame.top/mmdb/Country.mmdb
```

## Usage

Clash dashboard: `https://clash.razord.top`

## Example shell script

```
if [[ `pacman -Qi clash > /dev/null 2>&1` ]]; then
    sudo pacman -S clash
fi

mkdir $HOME/.config/clash > /dev/null 2>&1

curl -o $HOME/.config/clash/Country.mmdb http://www.ideame.top/mmdb/Country.mmdb
```
