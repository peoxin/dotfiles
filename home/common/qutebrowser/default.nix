{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/qutebrowser";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.qutebrowser];
  xdg.configFile."qutebrowser/config.py" = create_symlink "${configDir}/config.py";
  xdg.configFile."qutebrowser/userscripts" = create_symlink "${configDir}/userscripts";
}
