_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../laptop
  ];

  networking.hostName = "x1c";

  # state version, never change this
  system.stateVersion = "25.05";
}
