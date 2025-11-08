_: {
  config = {
    programs.proxychains = {
      enable = true;
      proxies = {
        v2 = {
          enable = true;
          type = "socks5";
          host = "127.0.0.1";
          port = 1080;
        };
      };
    };
  };
}
