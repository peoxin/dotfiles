{lib, ...}: let
  mirrorEnv = {
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git";
    HOMEBREW_API_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles";
    HOMEBREW_PIP_INDEX_URL = "https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple";
  };
in {
  environment.variables = mirrorEnv;

  # Set environment variables for nix-darwin before run `brew bundle`.
  system.activationScripts.homebrew.text = let
    envScript = lib.attrsets.foldlAttrs (acc: name: value: acc + "\nexport ${name}=${value}") "" mirrorEnv;
  in
    lib.mkBefore ''
      echo >&2 "${envScript}"
      ${envScript}
    '';
}
