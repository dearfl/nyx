_: {
  imports = [
    ./hardware.nix

    ../laptop
  ];

  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
