_: {
  imports = [
    ./hardware.nix

    ../minimal

    ../optional/wifi.nix

    ../optional/clickhouse.nix

    ../optional/rpi.nix
  ];

  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
