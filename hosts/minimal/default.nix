_: {
  imports = [
    ../../users/flr.nix

    ./packages.nix

    ./common.nix
    ./nix.nix
    ./firewall.nix
    ./doas.nix

    ./git.nix
    ./ssh.nix
    ./direnv.nix
  ];
}
