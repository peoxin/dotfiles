{config, ...}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/linux/niri";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  xdg.configFile."niri/config.kdl" = create_symlink "${configDir}/config.kdl";
}
