{
  lib,
  modulesPath,
  nixos-raspberrypi,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    # Hardware configuration
    nixos-raspberrypi.nixosModules.raspberry-pi-4.base
    nixos-raspberrypi.nixosModules.raspberry-pi-4.display-vc4
    nixos-raspberrypi.nixosModules.raspberry-pi-4.bluetooth
  ];

  boot.initrd.availableKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "bcm2835-v4l2" ];
  boot.extraModulePackages = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
