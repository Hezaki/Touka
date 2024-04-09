{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/6eb99a5c-9972-405c-af3f-bc56ecc007a9";
      fsType = "ext4";
			# options = [
			#	"rw"
			#	"relatime"
			#	"ssd_spread"
			#	"space_cache"
			#	"max_inline=256"
			#	"commit=600"
			#	"nodatacow"
			#];
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
