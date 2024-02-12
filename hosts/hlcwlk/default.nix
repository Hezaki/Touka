{ inputs, config, lib, pkgs, modulesPath, ... }: {
  imports = [
    ./system/systemd.nix
    ./system/enviroment.nix
    ./system/hardware.nix
    ./system/variables.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
   loader = {
     grub = { 
       enable = true;
       device = "/dev/sda";
       useOSProber = lib.mkForce false;
       efiSupport = lib.mkForce false;
       splashImage = null;
     };
     timeout = 2;
   };
   initrd = {
    systemd.enable = true;
    availableKernelModules = [
      "xhci_pci"
      "ahci"
      "ohci_pci"
      "ehci_pci"
      "pata_atiixp"
      "ums_realtek"
      "sd_mod"
      "sr_mod"
      "sdhci_pci"
      "usb_storage"
    ];
    kernelModules = [ ];
   };
   kernelPackages = inputs.chaotic.packages.${pkgs.system}.linuxPackages_cachyos-lto;
   kernelParams = [ 
     "quiet"
     "nowatchdog"
     "page_alloc.shuffle=1"
     "threadirqs"
     "split_lock_detect=off"
     "pci=pcie_bus_perf"
   ];
   kernelModules = [
     "kvm-amd"
     "amdgpu"
   ];
   extraModulePackages = [ ];
   consoleLogLevel = 0;
   initrd.verbose = false;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8caac839-80a8-467a-815a-5f32ad5e987a";
    fsType = "btrfs";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/EF17-75F8";
    fsType = "vfat";
  };

  fileSystems."/home/Files" = {
    device = "/dev/disk/by-uuid/2d30a4a4-c3a3-40ff-b125-4c1b5b8bf0ac";
    fsType = "ext4";
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 2048;
  }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  system.stateVersion = "23.05";
}
