{
  lib,
  modulesPath,
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    "${nixos-hardware}/lenovo/thinkpad/t14/amd/gen1"
    chaotic.nixosModules.nyx-cache
    chaotic.nixosModules.nyx-overlay
    chaotic.nixosModules.nyx-registry
    stylix.nixosModules.stylix
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
      grub = {
        enable = true;
        efiSupport = true;
        timeoutStyle = "hidden";
        splashImage = null;
        device = "nodev";
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    # plymouth.enable = true;

    initrd = {
      systemd.enable = true;
      compressor = "zstd";
      compressorArgs = [ "-9" ];
      availableKernelModules = [
        "nvme"
        "xhci_pci_renesas"
        "usbhid"
        "rtsx_pci_sdmmc"
      ];
      verbose = false;
    };

    kernelPackages = pkgs.linuxPackages_cachyos;

    kernelParams = [
      "quiet"
      "rd.systemd.show_status=false"
      "page_alloc.shuffle=1"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
      "threadirqs"
      "split_lock_detect=off"
      "pci=pcie_bus_perf"
    ];

    consoleLogLevel = 0;
    kernelModules = [ "kvm-amd" ];
    tmp.cleanOnBoot = true;
  };

  # stylix = {
  #   enable = true;
  #   image = ./images/wp.png;
  #   polarity = "dark";
  #   base16Scheme = {
  #     base00 = "#0d0c0c";
  #     base01 = "#12120f";
  #     base02 = "#1D1C19";
  #     base03 = "#282727";
  #     base04 = "#727169";
  #     base05 = "#DCD7BA";
  #     base06 = "#C8C093";
  #     base07 = "#717C7C";
  #     base08 = "#C34043";
  #     base09 = "#FFA066";
  #     base0A = "#C0A36E";
  #     base0B = "#76946A";
  #     base0C = "#6A9589";
  #     base0D = "#7E9CD8";
  #     base0E = "#957FB8";
  #     base0F = "#D27E99";
  #   };
  #   targets.grub.enable = false;
  # };

  services.fwupd.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "24.11";
}
