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

            exec-once = "${pkgs.yambar}/bin/yambar";

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
              gaps_in = 5;
              gaps_out = 10;
              border_size = 2;
              layout = "master";
            };

            decoration = {
              rounding = 4;
              inactive_opacity = 0.8;
              active_opacity = 0.92;
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
                # "$mod, S, exec, ${pkgs.flameshot}/bin/flameshot gui"
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
                "$mod, H, layoutmsg, mfact, -0.2"
                "$mod, L, layoutmsg, mfact, +0.2"
                "$mod SHIFT, Q, exit"
                "$mod, M, togglespecialworkspace, magic"
                "$mod SHIFT, M, movetoworkspace, special:magic"
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
                "float, class:bevy, title: bevy"
              ];
          };
        };
      };
    };

    # we want some app launcher, default wofi is good enough
    programs.wofi.enable = true;

    # we want some bar
    programs.yambar =
      let
        mkDeco = color: {
          stack = [
            {
              underline = {
                inherit color;
                size = 2;
              };
            }
          ];
        };
      in
      {
        enable = true;
        settings = {
          bar = {
            location = "bottom";
            height = 32;
            background = "222222ff";
            foreground = "dfdfdfff";
            font = "Noto Sans Mono:size=14";
            spacing = 8;
            margin = 16;

            left = [
              {
                clock = {
                  date-format = "%a %d";
                  time-format = "%H:%M";
                  content = [
                    {
                      string = {
                        text = "{date} {time}";
                        deco = mkDeco "0a6cf5ff";
                      };
                    }
                  ];
                };
              }

              # TODO: workspaces
              # this is not working right now, pinging might be able to help
              # update this when yambar-hyprland-wses updates
              # {
              #   script = {
              #     path = "${pkgs.yambar-hyprland-wses}/bin/yambar-hyprland-wses";
              #     content.list = {
              #       spacing = 6;
              #       items =
              #         let
              #           mkWorkspaceRule = i: {
              #             map =
              #             let
              #               ws = builtins.toString (i + 1);
              #               count = i + 2;
              #             in
              #             {
              #               default = { string = { text = ws; foreground = "bbbbbbff"; }; };
              #               conditions = {
              #                 "workspace_count < ${builtins.toString count}" = { empty = {}; };
              #                 "workspace_${ws}_focused" = { string = { text = ws; foreground = "fba922ff"; }; };
              #                 "workspace_${ws}_active" = { string = { text = ws; foreground = "ffaa00ff"; }; };
              #                 "workspace_${ws}_windows == 0" = { string = { text = ws; foreground = "555555ff"; }; };
              #               };
              #             };
              #           };
              #         in
              #         builtins.genList mkWorkspaceRule 9;
              #     };
              #   };
              # }

              # app title
              {
                foreign-toplevel.content.map.conditions = {
                  "~activated" = {
                    empty = { };
                  };
                  activated = [
                    {
                      string = {
                        text = "{app-id}";
                        foreground = "fba922ff";
                      };
                    }
                    {
                      string = {
                        text = ": {title}";
                      };
                    }
                  ];
                };
              }
            ];

            right = [
              {
                network = {
                  poll-interval = 5000;
                  content.map = {
                    default = {
                      empty = { };
                    };
                    conditions = {
                      "state == down" = {
                        string = {
                          text = "";
                          foreground = "ff0000ff";
                        };
                      };
                      "state == up".map = {
                        deco = mkDeco "9f78e1ff";
                        conditions =
                          let
                            mkSymbol = symbol: {
                              string = {
                                text = "${symbol} {ssid}";
                              };
                            };
                          in
                          {
                            "signal >= -50" = mkSymbol "🌣";
                            "signal >= -55" = mkSymbol "🌤";
                            "signal >= -67" = mkSymbol "🌥";
                            "signal >= -70" = mkSymbol "🌦";
                            "signal >= -80" = mkSymbol "🌧";
                          };
                      };
                    };
                  };
                };
              }

              # cpu usage
              {
                cpu = {
                  poll-interval = 2000;
                  content.map.conditions."id < 0" = [
                    {
                      string = {
                        text = "💻 {cpu}%";
                        deco = mkDeco "f90000ff";
                      };
                    }
                  ];
                };
              }
            ];
          };
        };
      };
  };
}
