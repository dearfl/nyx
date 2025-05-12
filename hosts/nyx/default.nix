_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../laptop
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
