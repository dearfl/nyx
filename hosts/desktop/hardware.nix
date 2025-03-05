{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "nvidia" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/0b889a54-b93d-43af-9d24-c15f83c88352";
      fsType = "btrfs";
    };
    "/data" = {
      device = "/dev/disk/by-uuid/c1736df6-a7d9-41df-b090-60cfd5357c2b";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/A158-0FB4";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/2a2e1f31-7a24-4cb0-b4da-9eb406b76bce"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    nvidia = {
      open = false;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
}
