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
      "showee" = {
        hostname = "210.12.12.8";
        port = 3040;
        user = "peihaoxiang";
        serverAliveInterval = 30;
        serverAliveCountMax = 6;
      };
    };
  };
}
