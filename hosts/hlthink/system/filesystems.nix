{
  fileSystems = { 
    "/" = {
      device = "/dev/disk/by-uuid/b55b0807-4b15-41ac-b686-4b8fc6a97f31";
      fsType = "ext4";
    };
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  }; 
}
