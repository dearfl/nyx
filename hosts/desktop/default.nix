_: {
  imports = [
    ./hardware.nix

    ../../modules/common.nix
    ../../modules/nix.nix
    ../../modules/systemd-boot.nix
    ../../modules/firewall.nix
    ../../modules/doas.nix

    ../../modules/packages.nix

    ../../modules/git.nix
    ../../modules/ssh.nix

    ../../modules/static-web-server.nix

    ../../users/flr.nix
  ];

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  networking.hostName = "desktop";

  # state version, never change this
  system.stateVersion = "25.05";
}
