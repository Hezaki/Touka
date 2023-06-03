{ config, pkgs, ... }:

{
  boot = {
   loader.grub.enable = true;
   loader.grub.version = 2;
   loader.grub.device = "/dev/sda";
   loader.grub.splashImage = null;
   loader.timeout = 1;
   kernelPackages = pkgs.linuxPackages_xanmod_latest;
   kernelParams = [ "quiet" ];
   consoleLogLevel = 0;
   initrd.verbose = false;
  };
}
