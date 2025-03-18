{ pkgs, ... }:
{
  imports = [
    ./hardware.nix

    ../minimal

    ../../modules/systemd-boot.nix

    ../../modules/static-web-server.nix

    ../../users/flr.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    # port = 8000;
    acceleration = "cuda";
    package = pkgs.ollama-cuda;
  };

  # llama-cpp need specify models
  # services.llama-cpp = {
  #   enable = true;
  #   host = "0.0.0.0";
  #   # port = 8000;
  #   # acceleration = "cuda";
  #   # package = pkgs.ollama-cuda;
  # };

  networking.hostName = "desktop";

  # state version, never change this
  system.stateVersion = "25.05";
}
