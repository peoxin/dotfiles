{
  config,
  pkgs,
  ...
}: let
  configDir = "${config.home.homeDirectory}/dotfiles/home/common/nvim";
  create_symlink = path: {
    source = config.lib.file.mkOutOfStoreSymlink path;
  };
in {
  home.packages = [pkgs.neovim];
  xdg.configFile."nvim/init.lua" = create_symlink "${configDir}/init.lua";
  xdg.configFile."nvim/lua" = create_symlink "${configDir}/lua";
  xdg.configFile."nvim/snippets" = create_symlink "${configDir}/snippets";
  xdg.configFile."nvim/lazy-lock.json" = create_symlink "${configDir}/lazy-lock.json";
}
