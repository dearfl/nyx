{ pkgs, ... }:
{
  config = {
    home.packages = [
      pkgs.blender
      # pkgs.kicad
      pkgs.mupdf
      pkgs.sxiv
      pkgs.scrot
      pkgs.telegram-desktop
      pkgs.vial
    ];

    programs = {
      wofi.enable = true;
      mpv.enable = true;
      waybar.enable = true;
      obs-studio.enable = true;
    };
  };
}
