_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../minimal

    ../optional/wifi.nix

    ../optional/rpi.nix
  ];

  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
