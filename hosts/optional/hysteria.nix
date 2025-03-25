{ config, ... }:
{
  config = {
    services.hysteria = {
      enable = true;
      configFile = config.vaultix.secrets.h2-tw.path;
    };
  };
}
