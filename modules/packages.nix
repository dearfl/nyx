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
      rage
      ripgrep
      tmux
      tokei
      wget
      yazi
      yt-dlp
    ];
  };
}
