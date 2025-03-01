_: {
  config = {
    # ly & uwsm failed to start hyprland, so we use regreet for now
    # services.displayManager.ly.enable = true;
    services.greetd.enable = true;
    programs = {
      regreet.enable = true;
      uwsm = {
        enable = true;
        waylandCompositors = {
          hyprland = {
            prettyName = "Hyprland";
            comment = "Hyprland compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/Hyprland";
          };
        };
      };
      hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = false;
      };
    };
  };
}
