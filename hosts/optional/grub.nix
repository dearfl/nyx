_: {
  # use systemd-boot
  config = {
    boot.loader = {
      grub = {
        enable = true;
        # efiSupport = true;
        # efiInstallAsRemovable = true;
      };
      # efi.canTouchEfiVariables = true;
    };
  };
}
