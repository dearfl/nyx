{ pkgs, ... }:
{
  config = {
    services.ollama = {
      enable = true;
      host = "0.0.0.0";
      # port = 8000; # custom port will require more configuration
      acceleration = "cuda";
      package = pkgs.ollama-cuda;
    };
  };
}
