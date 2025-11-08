{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    initLua = ''require("git"):setup()'';
    plugins = {
      inherit (pkgs.yaziPlugins) git;
      inherit (pkgs.yaziPlugins) ouch;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "C" ];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = [ "g" "p" ];
          run = "cd ~/Projects";
          desc = "Go ~/Projects";
        }
      ];
    };
    settings = {
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
      plugin.prepend_previewers = [
        { mime = "application/*zip";            run = "ouch"; }
        { mime = "application/x-tar";           run = "ouch"; }
        { mime = "application/x-bzip2";         run = "ouch"; }
        { mime = "application/x-7z-compressed"; run = "ouch"; }
        { mime = "application/x-rar";           run = "ouch"; }
        { mime = "application/vnd.rar";         run = "ouch"; }
        { mime = "application/x-xz";            run = "ouch"; }
        { mime = "application/xz";              run = "ouch"; }
        { mime = "application/x-zstd";          run = "ouch"; }
        { mime = "application/zstd";            run = "ouch"; }
        { mime = "application/java-archive";    run = "ouch"; }
      ];
    };
  };
}
