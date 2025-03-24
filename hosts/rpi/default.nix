_: {
  imports = [
    ./hardware.nix

    ../minimal

    ../../modules/wifi.nix

    ../../modules/vaultix.nix
    ./vaultix.nix

    ../../modules/clickhouse.nix

    ../../modules/rpi.nix

    ../../users/flr.nix
  ];

  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
