{ pkgs, ... }:
{
  # bcm2711 for rpi 3, 3+, 4, zero 2 w
  # bcm2712 for rpi 5
  # See the docs at:
  # https://www.raspberrypi.com/documentation/computers/linux_kernel.html#native-build-configuration
  raspberry-pi-nix = {
    board = "bcm2711";
    libcamera-overlay.enable = true;
    uboot.enable = true;
  };
  # users.users.root.initialPassword = "root";
  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
    bluez
    bluez-tools
    ffmpeg
    # libcamera-apps
  ];
  hardware = {
    bluetooth.enable = true;
    raspberry-pi.config = {
      pi4 = {
        dt-overlays = {
          vc4-kms-v3d = {
            enable = true;
            params = {
              cma-512 = {
                enable = true;
              };
            };
          };
        };
      };
      all = {
        options = {
          start_x = {
            enable = true;
            value = true;
          };
          gpu_mem = {
            enable = true;
            value = 256;
          };
        };
        dt-overlays = {
          vc4-kms-v3d = {
            enable = true;
            params = { };
          };
        };
      };
    };
  };
}
