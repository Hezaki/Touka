{ pkgs, inputs, pkgsStable, ... }:{
  imports = with inputs; [ 
    nix-ld.nixosModules.nix-ld
    ./k3s
    ./nh
  ];

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
      nix-tree
      pkgsStable.fastfetch
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
    # libvirtd.enable = true;
    waydroid.enable = true;
  };

  programs = {
    zsh.enable = true;
    adb.enable = true;
    dconf.enable = true;
    gamescope.enable = true;
    light.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      package = pkgs.steam;
      gamescopeSession.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
