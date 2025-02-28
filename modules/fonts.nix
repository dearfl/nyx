{ pkgs, ... }:
{
  config = {
    fonts = {
      # disable default fonts packages because bottom & gnu-freefont
      enableDefaultPackages = false;
      packages = with pkgs; [
        fira-code
        font-awesome
        # new way to add nerd fonts
        nerd-fonts.fira-code
        noto-fonts
      ];
    };
  };
}
