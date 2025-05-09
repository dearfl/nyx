{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      utils,
      ...
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell =
          with pkgs;
          mkShell {
            buildInputs = [
              # (python3.withPackages (
              #   ps: with ps; [
              #     python-lsp-server
              #   ]
              # ))
              python3
              ruff
              uv
              # basedpyright
            ];
          };
      }
    );
}
