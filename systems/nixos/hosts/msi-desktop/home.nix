{config, lib, pkgs, inputs, ...}: let
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
    ".bashrc".source = link "config/bash/bashrc";
    ".bash_profile".source = link "config/bash/bash_profile";
    ".zshenv".source = link "config/zsh/env.zsh";
    ".zprofile".source = link "config/zsh/profile.zsh";
    ".zshrc".source = link "config/zsh/rc.zsh";
    ".gitconfig".source = link "config/git/gitconfig-unix";
    ".gitmessage".source = link "config/git/gitmessage";
    ".tmux.conf".source = link "config/tmux/tmux.conf";
    ".ssh/config".source = link "config/ssh/config";
    ".local/bin/set-proxy".source = link "bin/common/set-proxy";
    ".local/bin/audio-control".source = link "bin/linux/audio-control";
    ".local/bin/audio-pactl".source = link "bin/linux/audio-pactl";
    ".local/bin/bluetooth-connect".source = link "bin/linux/bluetooth-connect";
    ".local/bin/clipboard-history".source = link "bin/linux/clipboard-history";
    ".local/bin/network-connect".source = link "bin/linux/network-connect";
    ".local/bin/power-control".source = link "bin/linux/power-control";
    ".local/bin/quick-command".source = link "bin/linux/quick-command";
    ".local/bin/screenshot".source = link "bin/linux/screenshot";
    ".local/bin/unmount-usb-device".source = link "bin/linux/unmount-usb-device";
    ".local/bin/wallpaper".source = link "bin/linux/wallpaper";
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
    "mpd".source = link "config/mpd";
    "ncmpcpp".source = link "config/ncmpcpp";
    "niri".source = link "config/niri";
    "nvim".source = link "config/nvim";
    "tridactyl".source = link "config/firefox";
    "waybar".source = link "config/waybar";
    "zellij".source = link "config/zellij";
    "starship.toml".source = link "config/starship/starship.toml";

    # These targets also contain machine-local, generated or package-backed files.
    "fcitx5" = {
      source = link "config/fcitx5";
      recursive = true;
    };
    "fish" = {
      source = link "config/fish";
      recursive = true;
    };
    "hypr" = {
      source = link "config/hypr";
      recursive = true;
    };
    "qutebrowser" = {
      source = link "config/qutebrowser";
      recursive = true;
    };
    "shell" = {
      source = link "config/shell";
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
    # Shell wrappers and all application settings live in config/.
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableZshIntegration = false;
    enableNushellIntegration = false;
  };
  home.packages = with pkgs; [
    # Shared applications and their runtime helpers.
    neovim git jujutsu gitui tmux zellij starship kitty ghostty qutebrowser
    zoxide eza bat fd dust procs bottom sd ripgrep delta
    fastfetch mise fzf just watchexec jq tealdeer grex hexyl tokei hyperfine pastel
    imagemagick ffmpeg pandoc typst hugo ouch direnv poppler resvg

    # Development tools.
    uv rustup cmake meson ninja clang nodejs_24 python315 ruff opencode

    # Linux desktop applications.
    fuzzel dunst mpd ncmpcpp
    typora obsidian zed-editor obs-studio gimp inkscape imv mpv vlc
    wechat wpsoffice-cn qbittorrent clash-verge-rev
    libsForQt5.qtstyleplugin-kvantum libsForQt5.qt5ct libsForQt5.qt5.qtwayland
    kdePackages.qt6ct kdePackages.qtwayland
    fishPlugins.plugin-sudope
    (fishPlugins.buildFishPlugin {
      pname = "fish-extract";
      version = "unstable-b1204fa";
      src = fetchFromGitHub {
        owner = "shoriminimoe";
        repo = "fish-extract";
        rev = "b1204fa0a7c1e317c74f8f428e34dd29252754f7";
        sha256 = "17l2xj0csmkd9c7fhm125cwwxf51ci5w73igsmhmblidqwhp40n6";
      };
    })
  ];

  # Keep service wiring in Nix while MPD reads its native, editable config.
  systemd.user.services.mpd = {
    Unit = {
      Description = "Music Player Daemon";
      After = ["pipewire.service"];
    };
    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${lib.escapeShellArg "${config.home.homeDirectory}/.mpd/playlists"}";
      ExecStart = "${pkgs.mpd}/bin/mpd --no-daemon ${lib.escapeShellArg "${config.xdg.configHome}/mpd/mpd.conf"}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["default.target"];
  };

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
