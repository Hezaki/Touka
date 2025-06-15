{
  pkgs,
  inputs,
  pkgsStable,
  ...
}:
{
  imports = with inputs; [
    nur.modules.homeManager.default
    ./programs
    ./themes
  ];

  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "24.11";
    packages = with pkgs; [
      # (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
      # (pkgs.callPackage ./TEST/cpyvpn.nix { })
      (obsidian.override { commandLineArgs = [ "--ozone-platform=wayland" ]; })
      ripdrag
      easyeffects
      badlion-client
      dua
      duf
      foliate
      gcr
      gdb
      glfw-wayland
      gnome-secrets
      polkit_gnome
      gnome-weather
      home-manager
      jq
      libnotify
      libreoffice
      lutgen
      lutris
      pkgsStable.nekoray
      nix-init
      onefetch
      pavucontrol
      piper
      scrcpy
      socat
      swaybg
      swayimg
      tgpt
      thunderbird
      transmission_4-gtk
      xdg-utils
      xournalpp
      youtube-music
      zenity
    ];
  };

  services.gnome-keyring.enable = true;

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
      "cinny-4.2.1"
      "cinny-unwrapped-4.2.1"
    ];
    overlays = with inputs; [
      nur.overlay
      hyprpanel.overlay
    ];
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
