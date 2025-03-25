{ pkgs, ... }:
{
  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.cudaSupport = true;
    nixpkgs.config.nvidia.acceptLicense = true;

    environment.systemPackages = with pkgs; [
      cudaPackages.cudatoolkit # this is necessary for some application (ollama?
    ];

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
