_: {
  config = {
    services.desktopManager.plasma6.enable = true;
    services.xserver = {
      enable = true;
      xkb = {
        variant = "norman";
        options = "ctrl:swapcaps";
        model = "at-translated-set-2-keyboard";
      };
    };
    services.displayManager.sddm.enable = true;
  };
}
