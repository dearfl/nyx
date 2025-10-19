{ pkgs, ... }:
{
  imports = [
    ../minimal

    # ../../modules/hysteria.nix

    # ../optional/proxychains.nix
    # ../optional/vaultix.nix

    # ../optional/v2client.nix

    ../optional/systemd-boot.nix
    ../optional/wifi.nix

    ../optional/bluetooth.nix
    ../optional/touchpad.nix

    ../optional/chromium.nix

    ../optional/fonts.nix
    ../optional/sound.nix
    ../optional/x11.nix
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
