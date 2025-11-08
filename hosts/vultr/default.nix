_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../optional/grub.nix

    ../optional/nix-opinionated.nix

    ../minimal

    ./secret.nix
  ];

  time.timeZone = "America/New_York";
  networking.hostName = "vultr";

  # state version, never change this
  system.stateVersion = "25.05";
}
