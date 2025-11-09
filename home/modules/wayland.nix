_: {
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./hyprlock.nix
  ];
  config = {
    programs = {
      # we want some app launcher, default wofi is good enough
      wofi.enable = true;
    };

    services = {
      # auto lock
      hypridle = {
        enable = true;
        settings = {
          general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };

          listener = [
            {
              timeout = 900;
              on-timeout = "hyprlock";
            }
            {
              timeout = 1200;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
          ];
        };
      };
    };
  };
}
