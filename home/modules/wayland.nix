_: {
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];
  config = {
    programs = {
      # we want some app launcher, default wofi is good enough
      wofi.enable = true;
    };
  };
}
