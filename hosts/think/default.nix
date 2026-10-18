{
  lib,
  modulesPath,
  inputs,
  pkgs,
  ...
}:
{
  imports = with inputs; [
    lanzaboote.nixosModules.lanzaboote
    chaotic.nixosModules.default
    stylix.nixosModules.stylix
    ./systemd
    ./environment
    ./hardware
    ./filesystem
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;

      autoEnrollKeys = {
        enable = true;
        includeMicrosoftKeys = true;
        autoReboot = true;
      };
    };

    loader = {
      systemd-boot.enable = lib.mkForce false;
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

    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "page_alloc.shuffle=1"
      "boot.shell_on_fail"
      "threadirqs"
      "split_lock_detect=off"
      "pci=pcie_bus_perf"
      "pcie_aspm=off"
      "amdgpu.aspm=0"
      "pcie_port_pm=off"
      "psmouse.synaptics_intertouch=0"
    ];

    kernelModules = [ "amdgpu" ];
    tmp.cleanOnBoot = true;
  };

  stylix = {
    enable = true;
    image = ../../home/hezaki/themes/images/wp.png;
    polarity = "dark";

    base16Scheme = {
      base00 = "#141312";
      base01 = "#1E1D1C";
      base02 = "#242321";
      base03 = "#32302f";
      base04 = "#fdf8f6";
      base05 = "#dad8d2";
      base06 = "#fdf8f6";
      base07 = "#fcefdd";

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

  services = {
    fwupd.enable = true;
    dbus.implementation = "broker";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "26.05";
}
