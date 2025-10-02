_: {
  imports = [
    ../../users/root.nix
    ../../users/flr.nix

    ./packages.nix

    ./common.nix
    ./nix.nix
    ./firewall.nix
    ./doas.nix
    ./dns.nix

    ./git.nix
    ./ssh.nix
  ];
}
