{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.zen-browser.homeModules.beta
    ../../home/common/fish
    ../../home/common/zsh
    ../../home/common/yazi
    ../../home/common/starship
    ../../home/common/kitty
    ../../home/common/ghostty
    ../../home/common/nvim
    ../../home/common/git
    ../../home/common/jj
    ../../home/common/gitui
    ../../home/common/zellij
    ../../home/common/firefox
    ../../home/linux/hypr
    ../../home/linux/waybar
    ../../home/linux/fuzzel
    ../../home/linux/dunst
    ../../home/linux/mpd
    ../../home/linux/ncmpcpp
    ../../home/linux/niri
    ../../home/linux/fontconfig
    ../../home/linux/modules/fcitx5.nix
    ../../home/linux/modules/qt.nix
    ../../home/linux/modules/gtk.nix
    ../../home/linux/modules/cursor.nix
  ];

  # Set the username and home directory.
  home.username = "peoxin";
  home.homeDirectory = "/home/peoxin";
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  # Configure SSH.
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  programs.zen-browser.enable = true;
  home.packages = with pkgs; [
    # CLI alternatives
    zoxide # cd
    eza # ls
    bat # cat
    fd # find
    dust # du
    procs # ps
    bottom # top
    sd # sed
    ripgrep # grep
    delta # diff

    # Other CLI tools
    fastfetch
    fzf
    just
    watchexec
    jq
    tealdeer
    grex
    hexyl
    tokei
    hyperfine
    pastel
    imagemagick
    ffmpeg
    grimblast
    swappy

    # GUI applications
    zed-editor
    obsidian
    qbittorrent
    obs-studio
    gimp
    inkscape
    imv
    mpv
    vlc
    wechat
    wpsoffice-cn
    clash-verge-rev

    # Development
    python315
    rustup
  ];

  home.stateVersion = "25.05";
}
