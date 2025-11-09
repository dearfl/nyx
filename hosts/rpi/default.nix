_: {
  imports = [
    ./hardware.nix
    ./disko.nix
    ./common.nix

    ../minimal

    ../optional/nix-mirror.nix

    ../optional/static-web-server.nix

    ../optional/rpi.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "rpi";

  # state version, never change this
  system.stateVersion = "25.05";
}
