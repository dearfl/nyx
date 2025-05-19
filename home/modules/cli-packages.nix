{ pkgs, ... }:
{
  config = {
    home.packages = [
      pkgs.difftastic
      pkgs.gnuplot
      pkgs.pfetch-rs
      pkgs.you-get
      pkgs.zola
    ];

    programs = {
      gitui.enable = true;
      tealdeer.enable = true;
      gh.enable = true;
      eza.enable = true;
    };
  };
}
