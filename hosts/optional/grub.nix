_: {
  config = {
    boot.loader = {
      # this is mainly for vultr and vultr doesn't support efi
      grub = {
        enable = true;
        # efiSupport = true;
        # efiInstallAsRemovable = true;
      };
      # efi.canTouchEfiVariables = true;
    };
  };
}
