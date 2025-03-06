{ inputs, config, ... }:
{
  imports = [ inputs.vaultix.nixosModules.default ];
  config = {
    # valutix need one of these
    services.userborn.enable = true;
    # systemd.sysuser.enable = true;

    vaultix = {
      secrets = {
        v2ray-uuid = {
          file = ../secrets/v2ray-uuid.age;
        };
        v2ray-addr-hk = {
          file = ../secrets/v2ray-addr-hk.age;
        };
        v2ray-addr-tw = {
          file = ../secrets/v2ray-addr-tw.age;
        };
        v2ray-addr-sg = {
          file = ../secrets/v2ray-addr-sg.age;
        };
        v2ray-addr-us = {
          file = ../secrets/v2ray-addr-us.age;
        };
      };
      templates = {
        v2ray =
          let
            mkOutbound =
              {
                addr,
                port,
                uuid,
                protocol ? "vmess",
                encryption ? "chacha20-poly1305",
              }:
              {
                protocol = protocol;
                settings = {
                  vnext = [
                    {
                      address = addr;
                      port = port;
                      users = [
                        {
                          encryption = encryption;
                          id = uuid;
                        }
                      ];
                    }
                  ];
                };
              };
          in
          {
            content = builtins.toJSON {
              inbounds = [
                {
                  listen = "0.0.0.0";
                  port = 1080;
                  protocol = "socks";
                }
              ];
              outbounds = map mkOutbound [
                {
                  addr = config.vaultix.placeholder.v2ray-addr-us;
                  port = 52359;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
                {
                  addr = config.vaultix.placeholder.v2ray-addr-hk;
                  port = 50372;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
                {
                  addr = config.vaultix.placeholder.v2ray-addr-tw;
                  port = 50370;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
                {
                  addr = config.vaultix.placeholder.v2ray-addr-sg;
                  port = 51345;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
              ];
            };
            mode = "644";
          };
      };
    };
  };
}
