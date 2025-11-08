{pkgs, ...}: {
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
          on = ["C"];
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
        {
          on = ["g" "p"];
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
        {
          mime = "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}";
          run  = "ouch";
        }
      ];
    };
  };

  catppuccin.yazi = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };
}
