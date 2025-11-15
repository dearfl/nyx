{ pkgs, lib, ... }:
{
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
        variables = [ "--all" ];
      };
      settings = {
        monitor = [
          # ",preferred,auto,auto"
          "eDP-1, 2560x1440@60, 2560x0, auto"
          "HDMI-A-1, 2560x1440@60, 0x0, auto"
        ];

        # maybe we should replace binary paths?
        "$terminal" = lib.getExe pkgs.alacritty;
        "$menu" = "${lib.getExe pkgs.wofi} --show drun";
        "$screenshot" =
          "${lib.getExe pkgs.slurp} | ${lib.getExe pkgs.grim} -g - | ${lib.getExe pkgs.swappy} -f -";
        "$mod" = "SUPER";

        exec-once = [
          # (lib.getExe pkgs.waybar)
          # (lib.getExe pkgs.copyq)
        ];

        # laptop keyboard, we want norman layout
        device = {
          name = "at-translated-set-2-keyboard";
          kb_layout = "us";
          kb_variant = "norman";
          kb_options = "ctrl:swapcaps";
          resolve_binds_by_sym = "1";
        };

        env = [
          "XCURSOR_SIZE,24"
          "HYPRCURSOR_SIZE,24"
        ];

        general = {
          gaps_in = 2;
          gaps_out = 4;
          border_size = 2;
          layout = "master";
        };

        decoration = {
          rounding = 2;
          inactive_opacity = 0.94;
          active_opacity = 1.0;
        };

        master = {
          mfact = 0.45;
          new_status = "master";
          orientation = "right";
        };

        animations = {
          enabled = true;
        };

        # let turn off xwayland support for a try
        xwayland = {
          enabled = false;
        };

        bind =
          [
            "$mod, Return, exec, $terminal"
            "$mod, S, exec, $screenshot"
            "$mod, P, exec, $menu"
            "$mod, Q, killactive"
            "$mod, Space, togglefloating"
            "$mod, F, fullscreen"
            "$mod, K, layoutmsg, cycleprev"
            "$mod, J, layoutmsg, cyclenext"
            "$mod, G, layoutmsg, swapprev"
            "$mod, Y, layoutmsg, swapnext"
            "$mod, A, layoutmsg, swapwithmaster"
            "$mod, R, layoutmsg, orientationright"
            # not working
            # "$mod, H, layoutmsg, mfact, -0.2"
            # "$mod, L, layoutmsg, mfact, +0.2"
            "$mod SHIFT, Q, exit"
            "$mod, M, togglespecialworkspace, magic"
            "$mod SHIFT, M, movetoworkspace, special:magic"
            "$mod SHIFT, comma, movecurrentworkspacetomonitor, l"
            "$mod SHIFT, period, movecurrentworkspacetomonitor, r"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            let
              mkWorkspaceRule =
                idx:
                let
                  ws = toString (idx + 1);
                in
                [
                  "$mod, ${ws}, workspace, ${ws}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
                ];
            in
            builtins.concatLists (builtins.genList mkWorkspaceRule 9)
          );

        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "float, title:App" # Bevy examples
          "float, title:Bevy.*" # Bevy apps
        ];
      };
    };
  };
}
