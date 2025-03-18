{ pkgs, ... }:
{
  config = {
    home.packages = [
      pkgs.blender
      pkgs.kicad
      pkgs.zathura
      pkgs.telegram-desktop
      pkgs.vial
      pkgs.slurp
      pkgs.grim
      pkgs.imv
    ];

    programs = {
      mpv.enable = true;
      obs-studio.enable = true;
    };
  };
}
