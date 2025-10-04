_: {
  imports = [
    ./disko.nix
    ./hardware.nix
    ./vaultix.nix

    ../optional/grub.nix

    ../optional/vaultix.nix
    ../optional/v2server.nix

    ../optional/nix-opinionated.nix

    ../minimal
  ];

  time.timeZone = "America/New_York";
  networking.hostName = "vultr";

  # state version, never change this
  system.stateVersion = "25.05";
}
