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
    ./solaar
    ./gpu-screen-recorder
    # ./hamachi
    ./zapret
  ];

  services.xserver.displayManager.gdm.enable = true;

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
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };

  programs = {
    zsh.enable = true;
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;
    amnezia-vpn.enable = true;

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
