{ pkgs, ... }:
{
  config = {
    services.transmission = {
      enable = true;
      package = pkgs.transmission_4;
      user = "flr";
      group = "users";
      home = "/data/transmission";
      settings = {
        watch-dir-enabled = true;
        speed-limit-up-enabled = true;
        speed-limit-up = 1000;
      };
    };
  };
}
