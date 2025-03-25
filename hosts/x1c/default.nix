_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../minimal

    ../optional/systemd-boot.nix
    ../optional/wifi.nix
    ../optional/touchpad.nix
    ../optional/gui.nix
  ];

  networking.hostName = "x1c";

  # state version, never change this
  system.stateVersion = "25.05";
}
