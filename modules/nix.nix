{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  # nix settings
  config = {
    nix =
      let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
      in
      {
        # use stable nix
        package = pkgs.nixVersions.stable;
        # Opinionated: disable channels
        channel.enable = false;
        settings = {
          # use flakes
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          # Opinionated: disable global registry
          flake-registry = "";
          # Workaround for https://github.com/NixOS/nix/issues/9574
          nix-path = config.nix.nixPath;
          # mirrors
          substituters = [
            "https://mirrors.ustc.edu.cn/nix-channels/store"
            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          ];
          trusted-substituters = [
            "https://mirrors.ustc.edu.cn/nix-channels/store"
            "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          ];
        };
        # Opinionated: make flake registry and nix path match flake inputs
        registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      };
  };
}
