{ pkgs, inputs, ... }: let
  user = "hezaki";
  user2 = "samatovna";
  host = "hlcwlk";
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
  };

  virtualisation = {
    libvirtd.enable = true;
    lxd.enable = true;
  };

  users.users = {
    ${username} = {
      isNormalUser = true;
      initialPassword = passuser;
      home = "/home/${username}";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
    };

    ${username1} = {
      isNormalUser = true;
      initialPassword = passuser;
      home = "/home/${username1}";
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

  nix.settings = {
    builders-use-substitutes = true;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
