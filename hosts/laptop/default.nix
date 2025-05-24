_: {
  imports = [
    ../minimal

    ../optional/systemd-boot.nix
    ../optional/wifi.nix

    ../optional/bluetooth.nix
    ../optional/touchpad.nix

    ../optional/chromium.nix

    ../optional/gui.nix
    ../optional/nix-mirror.nix
  ];
}
