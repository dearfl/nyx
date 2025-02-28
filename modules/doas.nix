{ config, ... }:
{
  config = {
    security.sudo.enable = false;
    security.doas = {
      enable = true;
      extraRules = map (user: {
        users = [ user ];
        keepEnv = true;
        persist = true;
        setEnv = [ "SUDO_UID=${toString config.users.users.${user}.uid}" ];
      }) [ "flr" ];
    };
  };
}
