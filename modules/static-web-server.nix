_: {
  config = {
    services.static-web-server = {
      enable = true;
      root = "/data";
      listen = "[::]:80";
      configuration = {
        general = {
          directory-listing = true;
        };
      };
    };
  };
}
