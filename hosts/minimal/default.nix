_: {
  imports = [
    ../../users/root.nix
    ../../users/flr.nix

    ./packages.nix

    ./common.nix
    ./nix.nix
    ./firewall.nix
    ./doas.nix

    ./git.nix
    ./ssh.nix
  ];
}
