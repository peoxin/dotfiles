{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    libsForQt5.qt5.qtwayland
    kdePackages.qt6ct
    kdePackages.qtwayland
  ];

  catppuccin.kvantum = {
    enable = true;
    apply = true;
    flavor = "mocha";
    accent = "blue";
  };
}
