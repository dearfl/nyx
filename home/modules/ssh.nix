_: {
  config = {
    programs.ssh = {
      enable = true;

      matchBlocks = {
        "aliyun" = {
          hostname = "a.flr.me";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
        "gh" = {
          hostname = "github.com";
          user = "git";
          # identityFile = "/home/flr/.ssh/id_rsa";
          # proxyJump = "aliyun";
        };
        "router" = {
          hostname = "192.168.8.1";
          user = "root";
          extraOptions = {
            hostKeyAlgorithms = "ssh-rsa";
            fingerprintHash = "md5";
          };
        };
        "rpi" = {
          hostname = "192.168.8.114";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
      };
    };
  };
}
