{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.services.hysteria;
  inherit (lib)
    mkOption
    types
    mkPackageOption
    mkEnableOption
    mkIf
    ;
in
{
  options.services.hysteria = {
    enable = mkEnableOption "Whether to run hysteria server.";
    serve = mkEnableOption "using `hysteria-server` instead of `hysteria-client`";
    package = mkPackageOption pkgs "hysteria" { };
    configFile = mkOption {
      type = types.str;
      default = "/etc/hysteria/config.yaml";
      description = "Config file location, absolute path";
    };
  };

  config = mkIf (cfg.enable == true) {
    environment.systemPackages = [ cfg.package ];

    systemd.services.hysteria = {
      wantedBy = [ "multi-user.target" ];
      after = [
        "network-online.target"
        "nss-lookup.target"
      ];
      wants = [
        "network-online.target"
        "nss-lookup.target"
      ];
      unitConfig = {
        StartLimitIntervalSec = 0;
      };
      description = "hysteria daemon";
      serviceConfig =
        let
          binSuffix = if cfg.serve then "server" else "client";
        in
        {
          Type = "simple";
          DynamicUser = true;
          ExecStart = "${lib.getExe' cfg.package "hysteria"} ${binSuffix} -c $\{CREDENTIALS_DIRECTORY}/config.yaml";
          LoadCredential = [ "config.yaml:${cfg.configFile}" ];
          Environment = [ "HYSTERIA_DISABLE_UPDATE_CHECK=1" ];
          AmbientCapabilities = [
            "CAP_NET_ADMIN"
            "CAP_NET_BIND_SERVICE"
            "CAP_NET_RAW"
          ];
          CapabilityBoundingSet = [
            "CAP_NET_ADMIN"
            "CAP_NET_BIND_SERVICE"
            "CAP_NET_RAW"
          ];
          LimitNPROC = 512;
          LimitNOFILE = "infinity";
          Restart = "always";
          RestartSec = 1;
        };
    };
  };
}
