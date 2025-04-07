_: {
  config = {
    services.transmission = {
      enable = true;
      home = "/data/transmission";
      settings = {
        watch-dir-enabled = true;
      };
    };
  };
}
