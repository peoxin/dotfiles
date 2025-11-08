{config, ...}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/linux/hypr";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  xdg.configFile."hypr/hyprland.conf" = create_symlink "${configDir}/hyprland.conf";
  xdg.configFile."hypr/hypridle.conf" = create_symlink "${configDir}/hypridle.conf";
  xdg.configFile."hypr/hyprlock.conf" = create_symlink "${configDir}/hyprlock.conf";
  xdg.configFile."hypr/hyprpaper.conf" = create_symlink "${configDir}/hyprpaper.conf";
}
