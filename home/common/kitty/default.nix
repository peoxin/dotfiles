{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/kitty";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.kitty];
  xdg.configFile."kitty/kitty.conf" = create_symlink "${configDir}/kitty.conf";
}
