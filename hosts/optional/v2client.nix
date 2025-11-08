{ config, ... }:
{
  config = {
    services.v2ray = {
      enable = true;
      configFile = config.vaultix.templates.v2client.path;
    };
  };
}
