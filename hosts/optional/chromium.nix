{ pkgs, ... }:
{
  config = {
    environment.systemPackages = [ pkgs.chromium ];
  };
}
