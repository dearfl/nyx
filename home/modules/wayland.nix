{ pkgs, ... }:
{
  imports = [
    ./waybar.nix
  ];
  config = {
    wayland = {
      windowManager = {
        hyprland = {
          enable = true;
          systemd.enable = true;
          systemd.variables = [ "--all" ];
          settings = {
            monitor = [
              # ",preferred,auto,auto"
              "eDP-1, 2560x1440@60, 2560x0, auto"
              "HDMI-A-1, 2560x1440@60, 0x0, auto"
            ];

            # maybe we should replace binary paths?
            "$terminal" = "${pkgs.alacritty}/bin/alacritty";
            "$menu" = "${pkgs.wofi}/bin/wofi --show drun";
            "$screenshot" =
              "${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - | ${pkgs.swappy}/bin/swappy -f -";
            "$mod" = "SUPER";

            exec-once = [
              # "${pkgs.waybar}/bin/waybar"
              # "${pkgs.copyq}/bin/copyq"
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

            bind = [
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
    };

    programs = {
      # we want some app launcher, default wofi is good enough
      wofi.enable = true;

      hyprlock = {
        enable = true;
        settings = {
          general = {
            disable_loading_bar = true;
            grace = 300;
            hide_cursor = true;
            no_fade_in = false;
          };

          background = [
            {
              path = "screenshot";
              blur_passes = 3;
              blur_size = 8;
            }
          ];

          input-field = [
            {
              size = "200, 50";
              position = "0, -80";
              monitor = "";
              dots_center = true;
              fade_on_empty = false;
              font_color = "rgb(202, 211, 245)";
              inner_color = "rgb(91, 96, 120)";
              outer_color = "rgb(24, 25, 38)";
              outline_thickness = 5;
              # placeholder_text = '\'Password...'\';
              shadow_passes = 2;
            }
          ];
        };
      };

      # we want some bar
      #   yambar =
      #     let
      #       mkDeco = color: {
      #         stack = [
      #           {
      #             underline = {
      #               inherit color;
      #               size = 3;
      #             };
      #           }
      #         ];
      #       };
      #     in
      #     {
      #       enable = true;
      #       settings = {
      #         bar = {
      #           location = "bottom";
      #           height = 32;
      #           background = "222222ff";
      #           foreground = "dfdfdfff";
      #           font = "Noto Sans Mono:size=14";
      #           spacing = 8;
      #           margin = 16;

      #           left = [
      #             {
      #               clock = {
      #                 date-format = "%a %d";
      #                 time-format = "%H:%M";
      #                 content = [
      #                   {
      #                     string = {
      #                       text = "{date} {time}";
      #                       deco = mkDeco "458588ff";
      #                     };
      #                   }
      #                 ];
      #               };
      #             }

      #             # TODO: workspaces
      #             # this is not working right now, pinging might be able to help
      #             # update this when yambar-hyprland-wses updates
      #             # {
      #             #   script = {
      #             #     path = "${pkgs.yambar-hyprland-wses}/bin/yambar-hyprland-wses";
      #             #     content.list = {
      #             #       spacing = 6;
      #             #       items =
      #             #         let
      #             #           mkWorkspaceRule = i: {
      #             #             map =
      #             #             let
      #             #               ws = builtins.toString (i + 1);
      #             #               count = i + 2;
      #             #             in
      #             #             {
      #             #               default = { string = { text = ws; foreground = "bbbbbbff"; }; };
      #             #               conditions = {
      #             #                 "workspace_count < ${builtins.toString count}" = { empty = {}; };
      #             #                 "workspace_${ws}_focused" = { string = { text = ws; foreground = "fba922ff"; }; };
      #             #                 "workspace_${ws}_active" = { string = { text = ws; foreground = "ffaa00ff"; }; };
      #             #                 "workspace_${ws}_windows == 0" = { string = { text = ws; foreground = "555555ff"; }; };
      #             #               };
      #             #             };
      #             #           };
      #             #         in
      #             #         builtins.genList mkWorkspaceRule 9;
      #             #     };
      #             #   };
      #             # }

      #             # app title
      #             {
      #               foreign-toplevel.content.map.conditions = {
      #                 "~activated" = {
      #                   empty = { };
      #                 };
      #                 activated = [
      #                   {
      #                     string = {
      #                       text = "{app-id}";
      #                       foreground = "d65d0eff";
      #                     };
      #                   }
      #                   {
      #                     string = {
      #                       text = ": {title}";
      #                     };
      #                   }
      #                 ];
      #               };
      #             }
      #           ];

      #           right = [
      #             {
      #               # network status
      #               # sometimes network module just disappear for no reason
      #               network = {
      #                 poll-interval = 5000;
      #                 content.map = {
      #                   default = {
      #                     empty = { };
      #                   };
      #                   conditions = {
      #                     "state == down" = {
      #                       string = {
      #                         text = "";
      #                         foreground = "ff0000ff";
      #                       };
      #                     };
      #                     "state == up".map = {
      #                       deco = mkDeco "8f3f71ff";
      #                       conditions =
      #                         let
      #                           mkSymbol = symbol: {
      #                             string = {
      #                               text = "${symbol} {ssid}";
      #                             };
      #                           };
      #                         in
      #                         {
      #                           "signal >= -50" = mkSymbol "🌣";
      #                           "signal >= -55" = mkSymbol "🌤";
      #                           "signal >= -67" = mkSymbol "🌥";
      #                           "signal >= -70" = mkSymbol "🌦";
      #                           "signal >= -80" = mkSymbol "🌧";
      #                         };
      #                     };
      #                   };
      #                 };
      #               };
      #             }

      #             # cpu usage
      #             {
      #               cpu = {
      #                 poll-interval = 2000;
      #                 content.map.conditions."id < 0" = [
      #                   {
      #                     string = {
      #                       text = "💻 {cpu}%";
      #                       deco = mkDeco "689d6aff";
      #                     };
      #                   }
      #                 ];
      #               };
      #             }

      #             # memory
      #             {
      #               mem = {
      #                 content = [
      #                   {
      #                     string = {
      #                       text = " {percent_used}%";
      #                       deco = mkDeco "b16286ff";
      #                     };
      #                   }
      #                 ];
      #               };
      #             }

      #             # battery
      #             {
      #               battery = {
      #                 name = "BAT0";
      #                 content = [
      #                   {
      #                     string = {
      #                       text = "  {capacity}%";
      #                       deco = mkDeco "98971aff";
      #                     };
      #                   }
      #                 ];
      #               };
      #             }

      #           ];
      #         };
      #       };
      #     };
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
