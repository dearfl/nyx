{
  description = "My NixOS configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vaultix = {
      url = "github:milieuim/vaultix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    nixos-raspberrypi = {
      url = "github:nvmd/nixos-raspberrypi/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-hardware,
      disko,
      flake-parts,
      vaultix,
      home-manager,
      nixos-raspberrypi,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        imports = [
          # renc need this
          vaultix.flakeModules.default
          home-manager.flakeModules.default
          flake-parts.flakeModules.easyOverlay
        ];
        flake = {
          vaultix = {
            # vaultix configs
            # we don't use vaultix in rpi config
            nodes = nixpkgs.lib.filterAttrs (name: _: name != "rpi") self.nixosConfigurations;
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
            python = {
              path = ./templates/python;
              description = "Python template";
            };
            cpp = {
              path = ./templates/cpp;
              description = "C++ template with CMake";
            };
          };

          nixosConfigurations = {
            # my main laptop x1 carbon 8th gen
            nyx = withSystem "x86_64-linux" (
              { system, ... }:
              nixpkgs.lib.nixosSystem {
                inherit system;

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  # we are actually 8th gen, but it should be ok?
                  nixos-hardware.nixosModules.lenovo-thinkpad-x1-7th-gen

                  disko.nixosModules.disko

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
              nixpkgs.lib.nixosSystem {
                inherit system;

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  nixos-hardware.nixosModules.common-cpu-amd
                  nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
                  nixos-hardware.nixosModules.common-pc-ssd

                  disko.nixosModules.disko

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
              nixpkgs.lib.nixosSystem {
                inherit system;

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  nixos-hardware.nixosModules.common-cpu-intel
                  nixos-hardware.nixosModules.common-pc-laptop-ssd

                  disko.nixosModules.disko

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

            vultr = withSystem "x86_64-linux" (
              { system, ... }:
              nixpkgs.lib.nixosSystem {
                inherit system;

                # vaultix need this
                specialArgs = {
                  inherit inputs;
                };
                modules = [
                  disko.nixosModules.disko

                  ./hosts/vultr

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

            # raspberry pi 4b
            rpi = withSystem "aarch64-linux" (
              { system, ... }:
              nixos-raspberrypi.lib.nixosSystem {
                inherit system;

                specialArgs = {
                  inherit inputs nixos-raspberrypi;
                };
                modules = [
                  disko.nixosModules.disko

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
            };
          };
      }
    );
}
