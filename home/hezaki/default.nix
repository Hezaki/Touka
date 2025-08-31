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
      # (pkgs.callPackage ./cpyvpn.nix { })
      teamspeak3
      ppsspp-sdl-wayland
      # (obsidian.override { commandLineArgs = [ "--ozone-platform=wayland" ]; })
      obsidian
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
      pulsemixer
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
      xwayland-satellite
      batsignal
      powermode-indicator
      switcheroo
      jitsi-meet
    ];
  };

  services.gnome-keyring.enable = true;

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
      "jitsi-meet-1.0.8043"
    ];
    overlays = with inputs; [
      nur.overlay
    ];
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;

      extra-substituters = [
        "https://anyrun.cachix.org"
      ];

      extra-trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
