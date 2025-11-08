{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
      };
      "lab7105" = {
        hostname = "221.215.48.6";
        port = 7105;
        user = "peihaoxiang";
      };
      "lab7107" = {
        hostname = "221.215.48.6";
        port = 7107;
        user = "peihaoxiang";
      };
      "lab7109" = {
        hostname = "221.215.48.6";
        port = 7109;
        user = "peihaoxiang";
      };
    };
  };
}
