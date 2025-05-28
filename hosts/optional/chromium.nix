{ pkgs, ... }:
{
  config = {
    environment.systemPackages = [ pkgs.chromium ];
    programs.chromium.enable = true;
  };
}
