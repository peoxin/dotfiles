{pkgs, ...}: {
  home.packages = [pkgs.zsh-fzf-tab];
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    envExtra = ''
      export EDITOR=nvim
      export PATH=$PATH:$HOME/dotfiles/home/common/scripts:$HOME/dotfiles/home/linux/scripts
    '';
    shellAliases = {
      cd = "z";
      cat = "bat";
      du = "dust";
      find = "fd";
      grep = "rg";
      diff = "delta";
      top = "btm --basic";
      ps = "procs";

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
      proxy = "source set-proxy";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
        "sudo"
        "extract"
        "zoxide"
      ];
    };
    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];
  };
}
