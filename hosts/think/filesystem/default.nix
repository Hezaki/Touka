{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8847bd8f-4eba-4c0e-b049-49d989117b74";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/AFD1-2C8D";
      fsType = "vfat";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "lz4";
  };
}
