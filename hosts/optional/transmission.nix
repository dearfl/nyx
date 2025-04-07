_: {
  config = {
    services.transmission = {
      enable = true;
      user = "flr";
      group = "users";
      home = "/data/transmission";
      settings = {
        watch-dir-enabled = true;
      };
    };
  };
}
