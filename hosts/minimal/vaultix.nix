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
          file = ../../secrets/v2ray-uuid.age;
        };
        v2ray-addr = {
          file = ../../secrets/v2ray-addr.age;
        };
        h2-tw = {
          file = ../../secrets/h2-tw.age;
          owner = "root";
          group = "users";
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
                {
                  listen = "0.0.0.0";
                  port = 8080;
                  protocol = "http";
                }
              ];
              outbounds = map mkOutbound [
                {
                  addr = config.vaultix.placeholder.v2ray-addr;
                  port = 52370;
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
