_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../minimal

    ../optional/systemd-boot.nix
    ../optional/wifi.nix

    ../optional/bluetooth.nix
    ../optional/touchpad.nix

    ../optional/gui.nix

    ../optional/hysteria.nix
  ];

  networking.hostName = "nyx";

  # state version, never change this
  system.stateVersion = "25.05";
}
