{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/6eb99a5c-9972-405c-af3f-bc56ecc007a9";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/1B0B-2DBF"; 
      fsType = "vfat";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  }; 
}
