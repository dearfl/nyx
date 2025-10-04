{ pkgs, ... }:
{
  # nix settings
  config = {
    nix = {
      # use stable nix
      package = pkgs.nixVersions.stable;
      # Opinionated: disable channels
      channel.enable = false;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
      settings = {
        # use flakes
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };
    };
  };
}
