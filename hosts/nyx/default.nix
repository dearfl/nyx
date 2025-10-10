_: {
  imports = [
    ./disko.nix
    ./hardware.nix
    ./vaultix.nix

    ../laptop
  ];

  programs.adb.enable = true;

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
