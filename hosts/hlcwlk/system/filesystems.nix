{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/8caac839-80a8-467a-815a-5f32ad5e987a";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/EF17-75F8";
      fsType = "vfat";
    };
    "/home/Files" = {
      device = "/dev/disk/by-uuid/2d30a4a4-c3a3-40ff-b125-4c1b5b8bf0ac";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 2048;
    }
  ];
}
