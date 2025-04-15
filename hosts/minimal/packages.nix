{ pkgs, ... }:
{
  config = {
    # we want some common cli packages
    environment.systemPackages = with pkgs; [
      bat
      bottom
      btrfs-progs
      choose
      duf
      eza
      fd
      fish
      git
      helix
      hexyl
      jq
      lsof
      miniserve
      ncdu
      rage
      ripgrep
      tmux
      tokei
      wget
      xh
      yazi
      yt-dlp
    ];
  };
}
