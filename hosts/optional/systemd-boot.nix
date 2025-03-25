_: {
  # use systemd-boot
  config = {
    boot.loader = {
      systemd-boot = {
        # Use the systemd-boot EFI boot loader.
        enable = true;
        # at most 10 boot menu
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
