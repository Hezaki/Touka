{
  pkgs,
  inputs,
  pkgsStable,
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
    # ./k3s
  ];

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
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
    podman.enable = true;
    libvirtd.enable = true;
    waydroid.enable = true;
    spiceUSBRedirection.enable = true;
  };

  services.fwupd.enable = true;

  programs = {
    zsh.enable = true;
    adb.enable = true;
    dconf.enable = true;
    light.enable = true;
    gamemode.enable = true;
    virt-manager.enable = true;

    gamescope = {
      enable = true;
      package = pkgsStable.gamescope;
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
