_: {
  imports = [
    ../minimal

    ../../modules/hysteria.nix

    ../optional/proxychains.nix
    ../optional/vaultix.nix

    ../optional/v2client.nix
    ../optional/hysteria.nix

    ../optional/systemd-boot.nix
    ../optional/wifi.nix

    ../optional/bluetooth.nix
    ../optional/touchpad.nix

    ../optional/chromium.nix

    ../optional/gui.nix
    ../optional/nix-mirror.nix
  ];
}
