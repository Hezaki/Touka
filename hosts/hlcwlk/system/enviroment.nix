{ pkgs, lib, inputs, ... }: let
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
    useUserPackages = true; 
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
    sudo.enable = false;
    pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };

  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = false;
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
    noto-fonts-emoji
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
    builders-use-substitutes = true;
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };
}
