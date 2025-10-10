{
  lib,
  config,
  inputs,
  ...
}:
{
  # opinionated nix settings
  config = {
    nix =
      let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
      in
      {
        settings = {
          # Opinionated: disable global registry
          flake-registry = "";
          # Workaround for https://github.com/NixOS/nix/issues/9574
          nix-path = config.nix.nixPath;
        };
        # Opinionated: make flake registry and nix path match flake inputs
        # registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      };
  };
}
