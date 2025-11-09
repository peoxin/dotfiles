{config, ...}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/linux/waybar";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  xdg.configFile."waybar/config.jsonc" = create_symlink "${configDir}/config.jsonc";
  xdg.configFile."waybar/modules.jsonc" = create_symlink "${configDir}/modules.jsonc";
  xdg.configFile."waybar/style.css" = create_symlink "${configDir}/style.css";
}
