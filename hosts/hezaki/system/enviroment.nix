{ config, pkgs, inputs, ... }: 

{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true; 
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix = {
    settings = {
      trusted-users = [ 
        "hezaki"
        "root"
      ];
      trusted-substituters = [
        "https://nyx.chaotic.cx"
      ];
      extra-trusted-substituters = [
        "https://nyx.chaotic.cx"
      ];
      substituters = [ 
        "https://hyprland.cachix.org"
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
        "https://nyx.chaotic.cx"
      ];
      trusted-public-keys = [
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      extra-trusted-public-keys = [
        "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
        "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
      auto-optimise-store = true;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    iftop
    neofetch
    nix-tree
    killall
    unzip
    rnix-lsp
    zip
    unrar
    neovim
    tmux
    wget
    tree
    doas
    lsd
    p7zip
    ranger
    bat
    brillo
    htop
  ];

  programs = {
    zsh.enable = true;
  };

  users.users.root = {
   initialPassword = "710100281000000";
   shell = pkgs.zsh;
  };

  users.users.hezaki = {
   isNormalUser = true;
   initialPassword = "heartpex";
   home = "/home/hezaki";
   extraGroups = [ "wheel" "adbusers" "podman" "docker" ];
   shell = pkgs.zsh;
  };

  security = {
    doas = {
    enable = true;
      extraConfig = ''
      permit persist keepenv :wheel
      '';
    };
  };

  time.timeZone = "Europe/Samara";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LANG = "en_US.UTF-8"; };
  };
}
