_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../minimal

    ../optional/vaultix.nix

    ../optional/wifi.nix
    ../optional/nix-mirror.nix

    ../optional/rpi.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
