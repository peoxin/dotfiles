{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      cd = "z";
      cat = "bat";
      du = "dust";
      find = "fd";
      grep = "rg";
      diff = "delta";
      top = "btm --basic";
      ps = "procs";
      x = "extract";

      # Eza
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      tree = "eza --tree";

      # Git
      gst = "git status";
      glg = "git log --date=iso --format='%C(yellow)%h %Creset%s %C(dim)%ad %an'";
      ggraph = "git log --all --graph --oneline --decorate";
      gaa = "git add .";
      gcm = "git commit -m";
      gp = "git push";

      # Jujutsu
      jst = "jj st";
      jsh = "jj show";
      jlg = "jj log";

      hl = "hyprland";
      proxy = "exec bash -c 'source set-proxy on; exec fish'";
      noproxy = "exec bash -c 'source set-proxy off; exec fish'";
    };
    shellInitLast = ''
      set EDITOR nvim
      fish_vi_key_bindings
      zoxide init fish | source
    '';
    plugins = [
      {
        name = "plugin-sudope";
        src = pkgs.fishPlugins.plugin-sudope.src;
      }
      {
        name = "fish-extract";
        src = pkgs.fetchFromGitHub {
          owner = "shoriminimoe";
          repo = "fish-extract";
          rev = "b1204fa0a7c1e317c74f8f428e34dd29252754f7";
          sha256 = "17l2xj0csmkd9c7fhm125cwwxf51ci5w73igsmhmblidqwhp40n6";
        };
      }
    ];
  };

  # Use bash as the login shell and then enter fish.
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export EDITOR=nvim
      export PATH=$PATH:$HOME/dotfiles/home/common/scripts:$HOME/dotfiles/home/linux/scripts
    '';
    initExtra = lib.mkBefore ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
