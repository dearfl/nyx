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

    ./vaultix.nix

    ./v2ray.nix
    ./hysteria.nix
  ];
}
