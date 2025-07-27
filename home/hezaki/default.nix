{
  pkgs,
  inputs,
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
    stateVersion = "25.11";

    packages = with pkgs; [
      # (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
      # teamspeak3
      ppsspp-sdl-wayland
      (obsidian.override { commandLineArgs = [ "--ozone-platform=wayland" ]; })
      badlion-client
      dua
      duf
      easyeffects
      gcr
      gdb
      glfw-wayland
      gnome-weather
      home-manager
      jq
      libnotify
      libreoffice
      lutgen
      lutris
      nix-init
      onefetch
      pavucontrol
      piper
      gnome-secrets
      polkit_gnome
      ripdrag
      scrcpy
      socat
      swaybg
      swayimg
      tgpt
      transmission_4-gtk
      xdg-utils
      xournalpp
      zenity
      element-desktop
      gradia
      mousai
      czkawka
    ];
  };

  services.gnome-keyring.enable = true;

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-28.3.1" ];
    overlays = with inputs; [ nur.overlay ];
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
