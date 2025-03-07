_: {
  imports = [
    ./hardware.nix

    ../../modules/common.nix
    ../../modules/nix.nix
    ../../modules/systemd-boot.nix
    ../../modules/wifi.nix
    ../../modules/firewall.nix
    ../../modules/doas.nix

    ../../modules/packages.nix

    ../../modules/git.nix
    ../../modules/ssh.nix

    ../../modules/fonts.nix
    ../../modules/sound.nix
    ../../modules/touchpad.nix
    ../../modules/hyprland.nix

    ../../users/flr.nix
  ];

  networking.hostName = "old";

  # state version, never change this
  system.stateVersion = "25.05";
}
