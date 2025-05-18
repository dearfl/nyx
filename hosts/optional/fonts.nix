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
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        wqy_microhei
      ];
    };
  };
}
