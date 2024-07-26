{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    ./systemd
    ./enviroment/fonts
    ./enviroment/local
    ./enviroment/nix
    ./enviroment/programs
    ./enviroment/security
    ./enviroment/users
    ./enviroment/home-manager
    ./enviroment/network
    ./enviroment/variables
    ./hardware
    ./filesystem
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        memtest86 = {
          enable = true;              
          sortKey = "o_memtest86";    
        };
        netbootxyz = {
          enable = true;
          sortKey = "o_netbootxyz";
        };
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
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
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [ 
      "quiet"
      "nowatchdog"
      "page_alloc.shuffle=1"
      "threadirqs"
      "split_lock_detect=off"
      "pci=pcie_bus_perf"
      "psmouse.synaptics_intertouch=0"
    ];
    kernelModules = [
      "kvm-intel"
    ];
    extraModulePackages = [ ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion = "24.05";
}
