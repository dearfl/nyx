{ pkgs, ... }:
{
  imports = [
    ../minimal

    ../optional/systemd-boot.nix
    ../optional/wifi.nix

    ../optional/bluetooth.nix
    ../optional/touchpad.nix

    ../optional/chromium.nix

    ../optional/fonts.nix
    ../optional/sound.nix
    ../optional/plasma.nix
    ../optional/nix-mirror.nix
    ../optional/nix-opinionated.nix
  ];

  config = {
    environment.systemPackages = [
      pkgs.vial
      pkgs.wemeet
      pkgs.feishu
    ];
  };
}
