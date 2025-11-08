{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/firefox";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  xdg.configFile."tridactyl/tridactylrc" = create_symlink "${configDir}/tridactylrc";
}
