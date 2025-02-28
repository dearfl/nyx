{ config, ... }:
let
  mkRule = user: {
    users = [ user ];
    keepEnv = true;
    persist = true;
    setEnv = [ "SUDO_UID=${toString config.users.users.${user}.uid}" ];
  };
in
{
  config = {
    security.sudo.enable = false;
    security.doas = {
      enable = true;
      extraRules = map mkRule [ "flr" ];
    };
  };
}
