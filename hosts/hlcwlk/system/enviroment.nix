{ pkgs, inputs, ... }: let
  username = "hezaki";
  hostname = "hlcwlk";
  passroot = "password";
  passuser = "password";
in {
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    nix-tree
    iftop
    htop
    fastfetch
    killall
    unzip
    zip
    neovim
    tmux
    wget
    tree
    p7zip
  ];

  networking = {
    hostName = hostname;
    networkmanager = {
      enable = true;
      insertNameservers = [ "1.1.1.1" "1.0.0.1" ];
    };
    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true; 
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  programs.zsh.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
  };

  users.users.root = {
    initialPassword = passroot;
    shell = pkgs.zsh;
  };

  users.users.${username} = {
    isNormalUser = true;
    initialPassword = passuser;
    home = "/home/${username}";
    extraGroups = [
      "wheel"
      "adbusers"
      "podman"
      "libvirtd"
    ];
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

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  time.timeZone = "Europe/Samara";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LANG = "en_US.UTF-8"; };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    jetbrains-mono
    ipafont
  ];

  console = {
    colors = [
      "1e1e2e" 
      "181825" 
      "313244" 
      "45475a" 
      "585b70" 
      "cdd6f4" 
      "f5e0dc" 
      "b4befe" 
      "f38ba8" 
      "fab387" 
      "f9e2af" 
      "a6e3a1" 
      "94e2d5" 
      "89b4fa" 
      "cba6f7" 
      "f2cdcd"
    ];
  };

  nix.settings = {
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
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
    extra-trusted-public-keys = [
      "nyx.chaotic.cx-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
    ];

    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
