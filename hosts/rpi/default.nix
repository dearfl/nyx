_: {
  imports = [
    ./hardware.nix

    ../minimal

    ../optional/wifi.nix

    ../optional/rpi.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
