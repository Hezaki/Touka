{ config, pkgs, ... }: {
  boot = {
   loader = {
     grub.enable = true;
     grub.device = "/dev/sda";
     grub.splashImage = null;
     timeout = 1;
   };
   kernelPackages = pkgs.linuxPackages_xanmod_latest;
   kernelParams = [ "quiet" ];
   consoleLogLevel = 0;
   initrd.verbose = false;
  };
}
