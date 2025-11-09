_: {
  imports = [
    ./disko.nix
    ./hardware.nix

    ../minimal
    ../optional/nix-mirror.nix
    ../optional/nix-opinionated.nix

    ../optional/systemd-boot.nix

    ../optional/cuda.nix
    ../optional/ollama.nix
    ../optional/emulation.nix
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "desktop";

  # state version, never change this
  system.stateVersion = "25.05";
}
