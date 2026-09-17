{config, pkgs, inputs, ...}: let
  dotfilesDirectory = "/home/peoxin/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/${path}";
in {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.zen-browser.homeModules.beta
  ];

  home.username = "peoxin";
  home.homeDirectory = "/home/peoxin";
  home.stateVersion = "25.05";
  home.file = {
    ".gitconfig".source = link "config/git/gitconfig-unix";
    ".gitmessage".source = link "config/git/gitmessage";
    ".ssh/config".source = link "config/ssh/config";
    ".local/bin/set-proxy".source = link "commands/common/set-proxy";
    ".local/bin/audio-control".source = link "commands/linux/audio-control";
    ".local/bin/audio-pactl".source = link "commands/linux/audio-pactl";
    ".local/bin/bluetooth-connect".source = link "commands/linux/bluetooth-connect";
    ".local/bin/clipboard-history".source = link "commands/linux/clipboard-history";
    ".local/bin/network-connect".source = link "commands/linux/network-connect";
    ".local/bin/power-control".source = link "commands/linux/power-control";
    ".local/bin/quick-command".source = link "commands/linux/quick-command";
    ".local/bin/screenshot".source = link "commands/linux/screenshot";
    ".local/bin/unmount-usb-device".source = link "commands/linux/unmount-usb-device";
    ".local/bin/wallpaper".source = link "commands/linux/wallpaper";
  };
  xdg.enable = true;
  xdg.configFile = {
    "dunst".source = link "config/dunst";
    "fontconfig".source = link "config/fontconfig";
    "fuzzel".source = link "config/fuzzel";
    "ghostty".source = link "config/ghostty";
    "gitui".source = link "config/gitui";
    "jj".source = link "config/jj";
    "kitty".source = link "config/kitty";
    "niri".source = link "config/niri";
    "nvim".source = link "config/nvim";
    "waybar".source = link "config/waybar";
    "zellij".source = link "config/zellij";
    "starship.toml".source = link "config/starship/starship.toml";

    # These targets also contain machine-local, generated or package-backed files.
    "fcitx5" = {
      source = link "config/fcitx5";
      recursive = true;
    };
    "hypr" = {
      source = link "config/hypr";
      recursive = true;
    };
    "yazi" = {
      source = link "config/yazi";
      recursive = true;
    };

    # Plugin code is installed by Nix; the application settings stay native.
    "yazi/plugins/git.yazi".source = pkgs.yaziPlugins.git;
    "yazi/plugins/ouch.yazi".source = pkgs.yaziPlugins.ouch;
  };
  xdg.dataFile = {
    "oh-my-zsh".source = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
    "zsh/plugins/fzf-tab".source = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    "zsh/plugins/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    "zsh/plugins/zsh-syntax-highlighting".source = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
  };
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  xdg.userDirs.setSessionVariables = true;
  programs.zen-browser.enable = true;
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    # The shell wrapper and application settings live in config/.
    enableZshIntegration = false;
  };
  home.packages = with pkgs; [
    # Shared applications and their runtime helpers.
    neovim git jujutsu gitui zellij starship kitty ghostty
    zoxide eza bat fd dust procs bottom sd ripgrep delta
    fastfetch mise fzf just watchexec jq tealdeer grex hexyl tokei hyperfine pastel
    imagemagick ffmpeg pandoc typst hugo ouch direnv poppler resvg

    # Development tools.
    uv rustup cmake meson ninja clang nodejs_24 python315 ruff opencode

    # Linux desktop applications.
    fuzzel dunst
    typora obsidian zed-editor obs-studio gimp inkscape imv mpv vlc
    wechat wpsoffice-cn qbittorrent clash-verge-rev
    libsForQt5.qtstyleplugin-kvantum libsForQt5.qt5ct libsForQt5.qt5.qtwayland
    kdePackages.qt6ct kdePackages.qtwayland
  ];

  # Nix still installs desktop integrations and package-backed theme assets.
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [kdePackages.fcitx5-chinese-addons catppuccin-fcitx5];
    };
  };
  home.pointerCursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    gtk.enable = true;
    hyprcursor.enable = true;
    size = 32;
  };
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-GTK-Dark";
      package = pkgs.magnetic-catppuccin-gtk.override {accent = ["default"];};
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {flavor = "mocha"; accent = "blue";};
    };
    cursorTheme = {
      name = "catppuccin-mocha-dark-cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.theme = config.gtk.theme;
  };
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
  catppuccin.kvantum = {
    enable = true;
    apply = true;
    flavor = "mocha";
    accent = "blue";
  };
  catppuccin.yazi = {enable = true; flavor = "mocha"; accent = "blue";};
}
