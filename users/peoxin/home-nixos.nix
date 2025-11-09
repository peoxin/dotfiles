{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./home.nix
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
