{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.vaultix.nixosModules.default ];
  config = {
    # valutix need one of these
    services.userborn.enable = true;
    # systemd.sysuser.enable = true;

    vaultix =
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
        mkInbound =
          {
            port,
            uuid,
            protocol ? "vmess",
          }:
          {
            listen = "0.0.0.0";
            port = port;
            protocol = protocol;
            settings = {
              clients = [
                {
                  id = uuid;
                }
              ];
            };
          };
      in
      {
        secrets = {
          # since v2ray's vmess outbound config doesn't support string port
          # we use a public port here
          v2-addr = {
            file = ../../secrets/v2-addr.age;
          };
          v2-uuid = {
            file = ../../secrets/v2-uuid.age;
          };
        };
        templates = {
          v2server = {
            mode = "644";
            content = builtins.toJSON {
              inbounds = map mkInbound [
                {
                  uuid = config.vaultix.placeholder.v2-uuid;
                  port = 52349;
                }
              ];
              outbounds = [
                {
                  protocol = "freedom";
                }
              ];
            };
          };

          v2client = {
            mode = "644";
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
                  # placeholder is a hash256 digest string
                  # so we could not use it as int type
                  addr = config.vaultix.placeholder.v2-addr;
                  uuid = config.vaultix.placeholder.v2-uuid;
                  port = 52349;
                }
              ];
            };
          };
        };
      };
  };
}
