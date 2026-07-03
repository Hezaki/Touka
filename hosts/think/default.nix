{
  lib,
  modulesPath,
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    chaotic.nixosModules.default
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

    initrd = {
      systemd.enable = true;
      compressor = "zstd";
      compressorArgs = [ "-9" ];
      availableKernelModules = [
        "nvme"
        "xhci_pci_renesas"
        "usbhid"
        "rtsx_pci_sdmmc"
        "ehci_pci"
      ];
      verbose = false;
    };

    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    extraModprobeConfig = ''
      options mt7921e disable_aspm=Y disable_he=Y bt_coex_low_pwr=N
    '';

    kernelParams = [
      "page_alloc.shuffle=1"
      "boot.shell_on_fail"
      "threadirqs"
      "split_lock_detect=off"
      "pci=pcie_bus_perf"
      "pcie_aspm=off"
      "amdgpu.aspm=0"
      "pcie_port_pm=off"
    ];

    kernel.sysctl = {
      "net.ipv4.conf.all.forwarding" = true;
      "net.ipv6.conf.all.forwarding" = true;
    };

    kernelModules = [ "amdgpu" ];
    tmp.cleanOnBoot = true;
  };

  stylix = {
    enable = true;
    image = ../../home/hezaki/themes/images/wp.png;
    polarity = "dark";

    base16Scheme = {
      base00 = "#131318";
      base01 = "#1b1b22";
      base02 = "#202029";
      base03 = "#464653";
      base04 = "#e3e1f6";
      base05 = "#c7c5d8";
      base06 = "#e3e1f6";
      base07 = "#f3f0ff";

      # syntax colors
      base08 = "#ffb3ab";
      base09 = "#f5bc74";
      base0A = "#e2c45c";
      base0B = "#80d6a3";
      base0C = "#4ecde3";
      base0D = "#adc6ff";
      base0E = "#d1bcff";
      base0F = "#ffb2cc";
    };

    targets.plymouth.enable = false;
  };

  services.fwupd.enable = true;

  chaotic.mesa-git.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "26.05";
}
