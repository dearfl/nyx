{ pkgs, ... }:
{
  config = {
    # unmanaged packages, maybe we should split them
    # into separate files
    home.packages = [
      pkgs.blender
      pkgs.difftastic
      # pkgs.kicad
      pkgs.gnuplot
      pkgs.mupdf
      pkgs.pfetch-rs
      pkgs.sxiv
      pkgs.scrot
      pkgs.telegram-desktop
      pkgs.vial
      pkgs.you-get
      pkgs.zola
    ];

    programs = {
      wofi.enable = true;
      mpv.enable = true;
      firefox.enable = true;
      waybar.enable = true;
      obs-studio.enable = true;
      yazi.enable = true;
      gitui.enable = true;
      tealdeer.enable = true;
      gh.enable = true;
      eza.enable = true;
    };
  };
}
