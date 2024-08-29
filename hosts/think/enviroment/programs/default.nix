{ pkgs, inputs, ... }:{
  imports = with inputs; [ 
    nix-ld.nixosModules.nix-ld
  ];

  environment = {
    enableDebugInfo = true;
    systemPackages = with pkgs; [
      nix-tree
      fastfetch
      vim
      wget
    ];
  };

  documentation = {
    enable = true;
    doc.enable = true;
    man.enable = true;
    dev.enable = true;
  };

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
    waydroid.enable = true;
  };

  programs = {
    zsh.enable = true;
    gamescope.enable = true;
    light.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      package = pkgs.steam;
      gamescopeSession.enable = true;
    };
    # nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
