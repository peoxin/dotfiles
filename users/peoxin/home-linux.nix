{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./home.nix
    ../../modules/linux/home/qt.nix
    ../../modules/linux/home/gtk.nix
    ../../modules/linux/home/cursor.nix
    ../../modules/linux/home/fcitx5.nix
    ../../home/linux/hypr
    ../../home/linux/waybar
    ../../home/linux/fuzzel
    ../../home/linux/dunst
    ../../home/linux/mpd
    ../../home/linux/ncmpcpp
    ../../home/linux/niri
    ../../home/linux/fontconfig
  ];

  # Configure user directories.
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  programs.zen-browser.enable = true;
  home.packages = with pkgs; [
    # GUI applications
    typora
    obsidian
    zed-editor
    obs-studio
    gimp
    inkscape
    imv
    mpv
    vlc
    wechat
    wpsoffice-cn
    qbittorrent
    clash-verge-rev
  ];
}
