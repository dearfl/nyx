_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../optional/emulation.nix

    ../laptop

    ./secret.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
