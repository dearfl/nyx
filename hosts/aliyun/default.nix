_: {
  imports = [
    ./disko.nix
    ./hardware.nix
    # ./vaultix.nix
    ../optional/grub.nix

    ../minimal
  ];

  networking.hostName = "aliyun";

  # state version, never change this
  system.stateVersion = "25.05";
}
