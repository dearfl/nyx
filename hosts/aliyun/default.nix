_: {
  imports = [
    ./disko.nix
    ./hardware.nix
    ./vaultix.nix

    ../optional/grub.nix

    ../optional/vaultix.nix
    # ../optional/v2server.nix

    ../minimal
  ];

  time.timeZone = "Asia/Shanghai";
  networking.hostName = "aliyun";

  # state version, never change this
  system.stateVersion = "25.05";
}
