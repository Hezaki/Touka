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
    # ./k3s
  ];

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
      nix-output-monitor
      nix-tree
      p7zip
      unrar
      unzip
      vim
      wget
    ];
  };

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
