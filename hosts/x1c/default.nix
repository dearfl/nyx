_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../x11
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "x1c";

  nixpkgs.config.allowUnfree = true;

  # state version, never change this
  system.stateVersion = "25.05";
}
