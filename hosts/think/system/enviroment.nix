{ pkgs, inputs, ... }: let
  user = "hezaki";
  host = "think";
  passroot = "password";
  passuser = "password";
in {
  imports = with inputs; [ 
    home-manager.nixosModules.home-manager 
    chaotic.homeManagerModules.default 
    nix-ld.nixosModules.nix-ld
  ];

  environment.systemPackages = with pkgs; [
    nix-tree
    light
    iftop
    htop-vim
    fastfetch
    vim
    nh
  ];

  networking = {
    hostName = host;
    networkmanager = {
      enable = true;
      insertNameservers = [ "1.1.1.1" "1.0.0.1" ];
    };
    dhcpcd = {
      wait = "background";
      extraConfig = "noarp";
    };
    firewall = {
      enable = true;
      allowedTCPPortRanges = [ 
        { from = 1714; to = 1764; }
      ];  
      allowedUDPPortRanges = [ 
        { from = 1714; to = 1764; }
      ];  
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
  };

  programs = {
    zsh.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    nix-ld.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
  };

  users.users = {
    ${user} = {
      isNormalUser = true;
      initialPassword = passuser;
      home = "/home/${user}";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
    };

    root = {
      initialPassword = passroot;
      shell = pkgs.zsh;
    };
  };

  security = {
    doas = {
      enable = true;
      extraConfig = ''
        permit persist keepenv :wheel
	      permit nopass hezaki as root cmd light
      '';
    };
    sudo.enable = false;
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
  };

  time.timeZone = "Europe/Samara";
  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    extraLocaleSettings = { LANG = "en_US.UTF-8"; };
  };
	
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    jetbrains-mono
    ipafont
    noto-fonts-emoji
  ];

  nixpkgs.config.allowUnfree = true;
  chaotic.nyx.cache.enable = true;

  nix.settings = {
    builders-use-substitutes = true;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
