{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = with inputs; [
    nix-gaming.nixosModules.platformOptimizations
    nix-index-database.nixosModules.nix-index
    ./nh
    ./kanata
    ./nix-ld
    ./clamav
    ./steam
    ./polkit
    ./podman
    ./flatpak
    ./gpu-screen-recorder
    ./zapret
    ./dns-crypt
    ./throne
    ./apparmor
    ./firejail
    ./scx
    ./dms
  ];

  environment.systemPackages = with pkgs; [
    nix-tree
    comma
    impala
  ];

  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = false;
    dev.enable = false;
  };

  virtualisation = {
    oci-containers.backend = "podman";
    libvirtd.enable = true;
    waydroid.enable = true;
    spiceUSBRedirection.enable = true;
  };

  services = {
    fwupd.enable = true;
    flatpak.enable = true;
    gvfs.enable = true;
    nfs.server.enable = true;

    kmscon.enable = lib.mkForce false;

    earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-termfilechooser
    ];

    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
      };
    };
  };

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;

    nix-index-database = {
      enable = true;
      comma.enable = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
