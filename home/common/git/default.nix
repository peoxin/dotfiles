{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "peoxin";
        email = "peoxin@outlook.com";
      };
      init = {
        defaultBranch = "main";
      };
      core = {
        autocrlf = "input";
        quotepath = false;
        pager = "delta";
      };
      fetch = {
        prune = true;
      };
      commit = {
        template = builtins.toString ./gitmessage;
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      delta = {
        navigate = true;
        lineNumbers = true;
        fileStyle = "omit";
        hunkHeaderStyle = "file line-number syntax";
      };
    };
  };
}
