_: {
  imports = [
    ./hardware.nix

    ../../modules/common.nix
    ../../modules/nix.nix
    ../../modules/systemd-boot.nix
    ../../modules/wifi.nix
    ../../modules/git.nix
    ../../modules/ssh.nix
    ../../modules/firewall.nix
    ../../modules/packages.nix
    ../../modules/doas.nix
    ../../modules/hyprland.nix
    ../../modules/fonts.nix

    ../../users/flr.nix
  ];

  networking.hostName = "x1c";

  # state version, never change this
  system.stateVersion = "25.05";
}
