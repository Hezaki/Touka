{
  pkgs,
  inputs,
  ...
}:

{
  imports = with inputs; [
    nix-gaming.nixosModules.platformOptimizations
    ./nh
    ./kanata
    ./nix-ld
    ./clamav
    ./steam
    ./polkit
    ./openvpn
    ./podman
    ./flatpak
    ./kubernetes
    ./gpu-screen-recorder
    ./zapret
    # ./zapret2
    ./dns-crypt
    ./throne
    ./localsend
    ./apparmor
    # ./pam
    ./firejail
    # ./tg-ws-proxy
  ];

  environment.systemPackages = with pkgs; [
    nix-tree
    nix-output-monitor
  ];

  documentation = {
    enable = true;
    man.enable = true;
    doc.enable = false;
    dev.enable = false;
  };

  programs.haguichi.enable = true;

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
    earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  programs = {
    zsh.enable = true;
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;
    # amnezia-vpn.enable = true;

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
