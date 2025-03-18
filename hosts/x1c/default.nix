_: {
  imports = [
    ./hardware.nix

    ../minimal

    ../../modules/systemd-boot.nix
    ../../modules/wifi.nix

    ../../modules/fonts.nix
    ../../modules/sound.nix
    ../../modules/touchpad.nix
    ../../modules/hyprland.nix

    ../../modules/vaultix.nix
    ./vaultix.nix

    ../../modules/v2ray.nix

    ../../users/flr.nix
  ];

  networking.hostName = "x1c";

  # state version, never change this
  system.stateVersion = "25.05";
}
