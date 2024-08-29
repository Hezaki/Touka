{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  imports = [
    "${inputs.nixos-hardware}/lenovo/thinkpad/t14/amd/gen1"
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
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    initrd = {
      systemd.enable = true;
      availableKernelModules = [
        "nvme"
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
      "kvm-amd"
    ];
    extraModulePackages = [ ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    tmp.cleanOnBoot = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion = "24.11";
}
