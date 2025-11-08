{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/linux/fuzzel";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.fuzzel];
  xdg.configFile."fuzzel/fuzzel.ini" = create_symlink "${configDir}/fuzzel.ini";
}
