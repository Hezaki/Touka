{ pkgs, inputs, ... }:{
  imports = with inputs; [ 
    nix-ld.nixosModules.nix-ld
  ];

  environment.systemPackages = with pkgs; [
    nix-tree
    fastfetch
    vim
  ];

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  programs = {
    zsh.enable = true;
    gamescope.enable = true;
    iftop.enable = true;
    light.enable = true;
    gamemode.enable = true;
    # steam = {
    #   enable = true;
    #   gamescopeSession.enable = true;
    # };
    # nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}
