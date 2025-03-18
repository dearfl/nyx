{
  description = "My NixOS configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
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
          home-manager.flakeModules.default
          flake-parts.flakeModules.easyOverlay
        ];
        flake = {
          nixosConfigurations = {
            # my main laptop x1 carbon 8th gen
            nyx = withSystem "x86_64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                modules = [
                  ./hosts/nyx

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

            # my main laptop x1 carbon 8th gen
            desktop = withSystem "x86_64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                modules = [
                  ./hosts/desktop

                  # home manager
                  home-manager.nixosModules.home-manager
                  {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.flr = import ./home/users/minimal.nix;
                  }
                ];
              }
            );

            # my old laptop
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
                    home-manager.users.flr = import ./home/users/minimal.nix;
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

        perSystem =
          { pkgs, ... }:
          {
            formatter = pkgs.nixfmt-rfc-style;
          };

        # debug = true;
      }
    );
}
