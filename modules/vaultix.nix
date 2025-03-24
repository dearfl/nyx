{ inputs, ... }:
{
  imports = [ inputs.vaultix.nixosModules.default ];
  config = {
    # valutix need one of these
    services.userborn.enable = true;
    # systemd.sysuser.enable = true;

    vaultix = {
      secrets = {
        h2-tw = {
          file = ../secrets/h2-tw.age;
          owner = "root";
          group = "users";
        };
      };
    };
  };
}
