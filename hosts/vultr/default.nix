_: {
  imports = [
    ./disko.nix
    ./hardware.nix
    # ./vaultix.nix
    ../optional/grub.nix

    ../minimal
  ];

  networking.hostName = "vultr";

  # state version, never change this
  system.stateVersion = "25.05";
}
