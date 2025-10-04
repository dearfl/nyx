_: {
  disko.devices.disk = {
    main = {
      type = "disk";
      device = "/dev/nvme0n1";
      content = {
        type = "gpt";
        partitions = {
          # do we need this?
          # boot = {
          #   name = "boot";
          #   size = "1M";
          #   type = "EF02";
          # };
          ESP = {
            priority = 1;
            name = "ESP";
            start = "1M";
            end = "1024M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };
          swap = {
            size = "20480M";
            content = {
              type = "swap";
              discardPolicy = "both";
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # Override existing partition
              mountpoint = "/";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };
          };
        };
      };
    };
    data = {
      type = "disk";
      device = "/dev/sda";
      content = {
        type = "gpt";
        partitions = {
          data = {
            size = "100%";
            content = {
              type = "btrfs";
              extraArgs = [ "-f" ]; # Override existing partition
              mountpoint = "/data";
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
            };
          };
        };
      };
    };
  };
}
