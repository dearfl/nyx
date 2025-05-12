_: {
  imports = [
    ./hardware.nix
    ./vaultix.nix

    ../minimal

    ../optional/systemd-boot.nix
    ../optional/static-web-server.nix
    ../optional/transmission.nix

    ../optional/cuda.nix
    ../optional/ollama.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "desktop";

  # state version, never change this
  system.stateVersion = "25.05";
}
