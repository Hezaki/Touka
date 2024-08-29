{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/aa508e9b-e713-40d4-833f-a949bdb1b361";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/1411-E386"; 
      fsType = "vfat";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "lz4";
  }; 
}
