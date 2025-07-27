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

    plymouth.enable = true;

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
    kernelModules = [ "amdgpu" ];
    tmp.cleanOnBoot = true;
  };

  stylix = {
    enable = true;
    image = ../../home/hezaki/themes/images/wp.png;
    polarity = "dark";

    base16Scheme = {
      base00 = "#222226";
      base01 = "#28282C";
      base02 = "#2E2E32";
      base03 = "#36363a";
      base04 = "#ffffff";
      base05 = "#ffffff";
      base06 = "#ffffff";
      base07 = "#6f8396";
      base08 = "#e62d42";
      base09 = "#ed5b00";
      base0A = "#c88800";
      base0B = "#3a944a";
      base0C = "#2190a4";
      base0D = "#3584e4";
      base0E = "#9141ac";
      base0F = "#d56199";
    };

    targets = {
      grub.enable = false;
      plymouth.enable = false;
    };
  };

  services.fwupd.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "25.05";
}
