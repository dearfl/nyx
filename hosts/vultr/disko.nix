_: {
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/vda";
    content = {
      type = "gpt";
      partitions = {
        boot = {
          name = "boot";
          size = "1M";
          type = "EF02";
        };
        ESP = {
          priority = 1;
          name = "ESP";
          start = "1M";
          end = "128M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        swap = {
          size = "1024M";
          content = {
            type = "swap";
            discardPolicy = "both";
            # randomEncryption = true;
            # priority = 100; # prefer to encrypt as long as we have space for it
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            # format = "ext4";
            extraArgs = [ "-f" ]; # Override existing partition
            mountpoint = "/";
            mountOptions = [
              "compress=zstd"
              "noatime"
              # "defaults"
            ];
          };
        };
      };
    };
  };
}
