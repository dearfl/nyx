{
  description = "My NixOS configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vaultix = {
      url = "github:milieuim/vaultix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      flake-parts,
      vaultix,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        imports = [
          vaultix.flakeModules.default
          home-manager.flakeModules.default
          flake-parts.flakeModules.easyOverlay
        ];
        flake = {
          vaultix = {
            # vaultix configs
            nodes = self.nixosConfigurations;
            identity = "./secrets/key.txt";
          };

          templates = {
            rust = {
              path = ./templates/rust;
              description = "Rust template, using Naersk";
            };
            bevy = {
              path = ./templates/bevy;
              description = "Bevy template";
            };
          };

          nixosConfigurations = {
            # my main laptop x1 carbon 8th gen
            nyx = withSystem "x86_64-linux" (
              { system, ... }:
              with inputs.nixpkgs;
              lib.nixosSystem {
                inherit system;

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  # we are actually 8th gen, but it should be ok?
                  nixos-hardware.nixosModules.lenovo-thinkpad-x1-7th-gen

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

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  nixos-hardware.nixosModules.common-cpu-amd
                  nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
                  nixos-hardware.nixosModules.common-pc-ssd
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

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  nixos-hardware.nixosModules.common-cpu-intel
                  nixos-hardware.nixosModules.common-pc-laptop-ssd
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

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  nixos-hardware.nixosModules.raspberry-pi-4

                  ./hosts/rpi

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
            devShells.default = pkgs.mkShell {
              buildInputs = [
                pkgs.nil
                pkgs.nixd
                pkgs.nixfmt-rfc-style
              ];
              shellHook = "exec ${pkgs.fish}/bin/fish";
            };
          };
      }
    );
}
