{ pkgs, lib, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  catppuccin.kvantum = {
    enable = true;
    apply = true;
    flavor = "mocha";
    accent = "blue";
  };
}
