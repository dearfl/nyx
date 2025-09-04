{ pkgs, ... }:
{
  config = {
    services.xserver.enable = true;
    services.desktopManager.plasma6.enable = true;
    # ervices.xserver.windowManager.dwm.enable = true;
    # services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    #   src = fetchGit {
    #     url = "https://github.com/dearfl/dwm.git";
    #     rev = "16dc1e2d3d390dedf9f00e5866ae56f4079c8787";
    #   };
    # };
    services.displayManager.sddm.enable = true;
    environment.systemPackages = [
      pkgs.wemeet
      pkgs.feishu
      # pkgs.dmenu
      # pkgs.st
    ];

  };
}
