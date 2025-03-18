_: {
  imports = [
    # unmanaged packages
    ./minimal.nix

    ../modules/gui-packages.nix

    ../modules/alacritty.nix
    ../modules/hyprland.nix
    ../modules/qutebrowser.nix
    ../modules/dunst.nix
  ];
}
