{ pkgs, ... }:
{
  config = {
    # we want some common cli packages
    environment.systemPackages = with pkgs; [
      bat
      bottom
      btrfs-progs
      eza
      fd
      fish
      git
      helix
      hexyl
      jq
      lsof
      ncdu
      ripgrep
      tmux
      tokei
      wget
      yazi
    ];
  };
}
