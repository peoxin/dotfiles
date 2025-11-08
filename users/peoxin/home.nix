{
  config,
  pkgs,
  inputs,
  hostConfig,
  ...
}: {
  imports =
    [
      inputs.catppuccin.homeModules.catppuccin
      inputs.zen-browser.homeModules.beta
      ./ssh.nix
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
    ]
    ++ (
      if hostConfig.os == "nixos"
      then [
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
      ]
      else []
    );

  # Set the username and home directory.
  home.username = "peoxin";
  home.homeDirectory =
    if hostConfig.os == "darwin"
    then "/Users/peoxin"
    else "/home/peoxin";

  # Configure user directories.
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;

  programs.zen-browser.enable =
    if hostConfig.os == "nixos"
    then true
    else false;
  home.packages = with pkgs;
    [
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
    ]
    ++ (
      if hostConfig.os == "nixos"
      then [
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
      ]
      else []
    );

  # CAREFULLY change this value only if you know what you're doing.
  home.stateVersion = "25.05";
}
