_: {
  imports = [
    ../../modules/hysteria.nix

    ../../users/flr.nix

    ./packages.nix

    ./common.nix
    ./nix.nix
    ./firewall.nix
    ./doas.nix

    ./git.nix
    ./ssh.nix
    ./direnv.nix

    ./vaultix.nix

    ./hysteria.nix
  ];
}
