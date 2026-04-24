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
    stylix.nixosModules.stylix
    ./systemd
    ./enviroment
    ./hardware
    ./filesystem
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = null;
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

    kernelPackages = pkgs.linuxPackages_xanmod_stable;

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
      base00 = "#121316";
      base01 = "#1e2022";
      base02 = "#272A2F";
      base03 = "#323539";
      base04 = "#E0E2E8";
      base05 = "#e9e1d9";
      base06 = "#F2F3F9";
      base07 = "#50462a";
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
  system.stateVersion = "25.11";
}
