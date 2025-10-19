{ pkgs, ... }:
{
  config = {
    home.packages = [
      pkgs.feh
      pkgs.i3lock
      pkgs.picom
    ];
    programs.rofi.enable = true;
    services.polybar = {
      enable = true;
      package = (pkgs.polybar.override { i3Support = true; }).overrideAttrs (
        final: prev: {
          src = fetchGit {
            url = "https://github.com/pgrondek/polybar-dwm.git";
            rev = "09eac084494d90310a5a27a01b32dc515f6db352";
            submodules = true;
          };
          postPatch = prev.postPatch or "" + ''
            sed -ie 's|cmake_minimum_required(.*)|cmake_minimum_required(VERSION 3.10)|g' lib/{xpp,dwmipcpp,i3ipcpp}/CMakeLists.txt
          '';
        }
      );
      script = "polybar &";
      settings = {
        colors = {
          background = "#222222";
          background-alt = "#444444";
          foreground = "#dfdfdf";
          foreground-alt = "#888888";
          primary = "#ffb52a";
          secondary = "#e60053";
          alert = "#bd2c40";
        };
        "bar/main" = {
          monitor = "\${env:MONITOR:}";
          width = "100%";
          height = "3.2%";
          radius = 6.0;
          fixed-center = false;
          bottom = true;
          override-redirect = false;

          background = "\${colors.background}";
          foreground = "\${colors.foreground}";

          border-size = 0;
          line-size = 2;
          padding = 1;
          module-margin = 1;

          font = [
            "Noto Sans Mono:size=12;1"
            "Noto Sans Mono:size=12;1"
            "Noto Sans Symbols:size=12;1"
            "Noto Sans Symbols2:size=12;1"
          ];

          modules-left = "date dwm xwindow";
          modules-center = "";
          modules-right = "wlan cpu memory";
        };
        "global/wm" = {
          margin-top = 0;
        };
        "module/xwindow" = {
          type = "internal/xwindow";
          label = "%title:0:30:...%";
        };
        "module/dwm" = {
          type = "internal/dwm";
          format = "<label-tags> <label-layout> <label-floating>";
          enable-tags-click = false;
          enable-tags-scroll = false;
          tags-scroll-empty = false;
          tags-scroll-reverse = false;
          tags-scroll-wrap = false;
          enable-layout-click = false;
          enable-layout-scroll = false;
          layout-scroll-wrap = false;
          layout-scroll-reverse = false;
          secondary-layout-symbol = "[M]";
          label-layout = "%symbol%";
          label-floating = "F";
          label-focused = " %name% ";
          label-focused-underline = "#fba922";
          label-occupied = " %name% ";
          label-occupied-foreground = "#ffaa00";
          label-unfocused = " %name% ";
          label-visible = " %name% ";
          label-urgent = " %name% ";
          label-urgent-underline = "#9b0a20";
          label-empty = " %name% ";
          label-empty-foreground = "#555555";
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;
          format-prefix = "💻 ";
          format-prefix-foreground = "\${colors.foreground-alt}";
          format-underline = "#f90000";
          label = "%percentage:2%%";
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 2;
          format-prefix = "🗍 ";
          format-prefix-foreground = "\${colors.foreground-alt}";
          format-underline = "#4bffdc";
          label = "%percentage_used:2%%";
        };

        "module/wlan" = {
          type = "internal/network";
          interface = "wlp3s0";
          interval = "5.0";
          format-connected = "<ramp-signal> <label-connected>";
          format-connected-underline = "#9f78e1";
          label-connected = "%essid%";
          label-disconnected = "";
          ramp-signal = [
            "🌧"
            "🌦"
            "🌥"
            "🌤"
            "🌣"
          ];
        };

        "module/date" = {
          type = "internal/date";
          interval = 1;
          date = "%a %m/%d";
          date-alt = "%a %b %m/%d";
          time = "%H:%M";
          time-alt = "%H:%M%p";
          format-prefix = "";
          format-prefix-foreground = "\${colors.foreground-alt}";
          format-underline = "#0a6cf5";
          label = "%date% %time%";
        };

        "module/filesystem" = {
          type = "internal/fs";
          interval = 30;
          format-underline = "#ffffff";
        };

        settings = {
          screenchange-reload = true;
        };
      };
    };
  };
}
