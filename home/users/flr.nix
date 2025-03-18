_: {
  imports = [
    # unmanaged packages
    ./minimal.nix

    ../modules/gui-packages.nix
    ../modules/fontconfig.nix

    ../modules/alacritty.nix
    ../modules/hyprland.nix
    ../modules/qutebrowser.nix
    ../modules/dunst.nix
    ../modules/fcitx5.nix
  ];
}
