{ pkgs, ... }:
{
  config = {
    wayland = {
      windowManager = {
        hyprland = {
          enable = true;
          systemd.enable = false;
          # systemd.variables = [ "--all" ];
          settings = {
            monitor = ",preferred,auto,auto";

            # maybe we should replace binary paths?
            "$terminal" = "${pkgs.alacritty}/bin/alacritty";
            "$menu" = "${pkgs.wofi}/bin/wofi --show drun";
            "$mod" = "SUPER";

            exec-once = "${pkgs.waybar}/bin/waybar";

            # laptop keyboard, we want norman layout
            device = {
              name = "at-translated-set-2-keyboard";
              kb_layout = "us";
              kb_variant = "norman";
              kb_options = "ctrl:swapcaps";
            };

            env = [
              "XCURSOR_SIZE,24"
              "HYPRCURSOR_SIZE,24"
            ];

            general = {
              gaps_in = 5;
              gaps_out = 10;
              border_size = 2;
              layout = "master";
            };

            decoration = {
              rounding = 6;
            };

            animations = {
              enabled = false;
            };

            bind =
              [
                "$mod, Return, exec, $terminal"
                "$mod, Q, killactive"
                "$mod, P, exec, $menu"
                "$mod SHIFT, Q, exit"
                "$mod, M, togglespecialworkspace, magic"
                "$mod SHIFT, M, movetoworkspace, special:magic"
              ]
              ++ (
                # workspaces
                # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
                builtins.concatLists (
                  builtins.genList (
                    i:
                    let
                      ws = i + 1;
                    in
                    [
                      "$mod, code:1${toString i}, workspace, ${toString ws}"
                      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                    ]
                  ) 9
                )
              );
          };
        };
      };
    };
  };
}
