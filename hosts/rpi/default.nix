_: {
  imports = [
    ./hardware.nix

    ../minimal

    ../../modules/wifi.nix

    ../../modules/clickhouse.nix

    ../../modules/rpi.nix

    ../../users/rpi.nix
  ];

  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
