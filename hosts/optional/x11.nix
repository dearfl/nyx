{ pkgs, ... }:
{
  config = {
    services.xserver = {
      enable = true;
      xkb = {
        variant = "norman";
        options = "ctrl:swapcaps";
        model = "at-translated-set-2-keyboard";
      };
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs (oldAttrs: rec {
          patches = [
            (pkgs.fetchpatch {
              url = "https://gist.githubusercontent.com/dearfl/cebdfa172fa7cd81a59bb844f2f33e2b/raw/4c49599f47fdefd9179105f432676980e1720a5f/dwm.patch";
              sha256 = "sha256-Z/WIgTaIIXXOWNqdVawkNUHi5uL3iov9KzC8HIBS3Pw=";
            })
          ];
          buildInputs = oldAttrs.buildInputs ++ [ pkgs.yajl ];
        });
      };
    };
    services.displayManager.sddm.enable = true;
  };
}
