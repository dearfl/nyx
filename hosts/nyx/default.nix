{ config, ... }:
{
  imports = [
    ./hardware.nix

    ../minimal

    ../../modules/systemd-boot.nix
    ../../modules/wifi.nix

    ../../modules/hysteria.nix

    ../../modules/fonts.nix
    ../../modules/bluetooth.nix
    ../../modules/sound.nix
    ../../modules/touchpad.nix
    ../../modules/hyprland.nix

    ../../modules/vaultix.nix
    ./vaultix.nix

    ../../modules/v2ray.nix

    ../../users/flr.nix
  ];

  services.hysteria = {
    enable = true;
    configFile = config.vaultix.secrets.h2-tw.path;
  };

  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
