{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/zellij";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.zellij];
  xdg.configFile."zellij/config.kdl" = create_symlink "${configDir}/config.kdl";
}
