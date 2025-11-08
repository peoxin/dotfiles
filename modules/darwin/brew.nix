{lib, ...}: let
  mirrorEnv = {
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
    HOMEBREW_PIP_INDEX_URL = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple";
  };
in {
  homebrew = {
    enable = true;
    onActivation = {
      # Enable homebrew to auto-update itself and all formulae.
      autoUpdate = false;
      # Enable homebrew to upgrade outdated packages.
      upgrade = false;
      # Uninstall all packages not listed in the generated brewfile.
      cleanup = "zap";
    };
  };

  environment.variables = mirrorEnv;
  environment.interactiveShellInit = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  # Set environment variables for nix-darwin before run `brew bundle`.
  system.activationScripts.homebrew.text = let
    envScript = lib.attrsets.foldlAttrs (acc: name: value: acc + "\nexport ${name}=${value}") "" mirrorEnv;
  in
    lib.mkBefore ''
      echo >&2 "${envScript}"
      ${envScript}
    '';
}
