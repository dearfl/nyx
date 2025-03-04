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
        v2ray-port-hk = {
          file = ../secrets/v2ray-port-hk.age;
        };
        v2ray-addr-tw = {
          file = ../secrets/v2ray-addr-tw.age;
        };
        v2ray-port-tw = {
          file = ../secrets/v2ray-port-tw.age;
        };
        v2ray-addr-sg = {
          file = ../secrets/v2ray-addr-sg.age;
        };
        v2ray-port-sg = {
          file = ../secrets/v2ray-port-sg.age;
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
            mode = "644";
            content = builtins.toJSON {
              inbounds = [{
                listen = "0.0.0.0";
                port = 1080;
                protocol = "socks";
              }];
              outbound = map mkOutbound [
                {
                  addr = config.vaultix.placeholder.v2ray-addr-hk;
                  port = config.vaultix.placeholder.v2ray-port-hk;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
                {
                  addr = config.vaultix.placeholder.v2ray-addr-tw;
                  port = config.vaultix.placeholder.v2ray-port-tw;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
                {
                  addr = config.vaultix.placeholder.v2ray-addr-sg;
                  port = config.vaultix.placeholder.v2ray-port-sg;
                  uuid = config.vaultix.placeholder.v2ray-uuid;
                }
              ];
            };
          };
      };
    };
  };
}
