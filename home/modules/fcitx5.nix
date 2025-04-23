{ pkgs, ... }:
{
  config = {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = [
        pkgs.fcitx5-gtk
        pkgs.fcitx5-chinese-addons
        pkgs.fcitx5-pinyin-zhwiki
        pkgs.fcitx5-tokyonight
        pkgs.libsForQt5.fcitx5-qt
      ];
    };
  };
}
