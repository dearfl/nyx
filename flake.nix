{
  description = "My NixOS configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      home-manager,
      raspberry-pi-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        imports = [
          inputs.home-manager.flakeModules.default
        ];
        flake = {
          nixosConfigurations = {
            # my main laptop x1 carbon 8th gen
            x1c = withSystem "x86_64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                modules = [
                  ./hosts/x1c

                  # home manager
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.flr = import ./home/users/flr.nix;
                  }
                ];
              }
            );

            # my old laptop
            old = withSystem "x86_64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                modules = [
                  ./hosts/old

                  # home manager
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.flr = import ./home/users/flr.nix;
                  }
                ];
              }
            );

            # raspberry pi 4b
            rpi = withSystem "aarch64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                modules = [
                  ./hosts/rpi

                  raspberry-pi-nix.nixosModules.raspberry-pi

                  # home manager
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.flr = import ./home/users/rpi.nix;
                  }
                ];
              }
            );
          };
        };

        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
      }
    );
}
