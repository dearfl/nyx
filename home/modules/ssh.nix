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
        "gl" = {
          hostname = "gitlab.com";
          user = "git";
          # identityFile = "/home/flr/.ssh/id_rsa";
          # proxyJump = "aliyun";
        };
        "router" = {
          hostname = "192.168.8.1";
          user = "root";
          # router need extra settings
          extraOptions = {
            hostKeyAlgorithms = "ssh-rsa";
            fingerprintHash = "md5";
          };
        };
        "rpi" = {
          hostname = "rpi";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
        "desktop" = {
          hostname = "desktop";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
        "x1c" = {
          hostname = "x1c";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
        "nyx" = {
          hostname = "nyx";
          user = "flr";
          # identityFile = "/home/flr/.ssh/id_rsa";
        };
      };
    };
  };
}
