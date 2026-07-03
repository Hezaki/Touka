{ pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./themes
  ];

  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "26.05";

    packages =
      with pkgs;
      with inputs;
      [
        tuba
        tesseract
        multiplex
        bluetui
        wiremix
        android-tools
        teamspeak3
        losslesscut-bin
        parsec-bin
        pywalfox-native
        tg-ws-proxy.packages.${stdenv.hostPlatform.system}.default
        evtest
        authenticator
        microfetch
        kdePackages.kdenlive
        cpu-x
        krita
        ppsspp-sdl-wayland
        obsidian
        dua
        duf
        gcr
        gdb
        glfw
        jq
        libnotify
        libreoffice
        lutgen
        nix-init
        onefetch
        gnome-secrets
        polkit_gnome
        ripdrag
        scrcpy
        swaybg
        swayimg
        transmission_4-gtk
        zenity
        element-desktop
        gradia
        mousai
        bleachbit
        xwayland-satellite
        gnome-decoder
        nautilus
        via
        piper
        gomi
        dtrx
      ];
  };

  services.gnome-keyring.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
    };
  };

  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnfree = true;

      permittedInsecurePackages = [
        "electron-28.3.1"
        "jitsi-meet-1.0.8043"
        "mbedtls-2.28.10"
      ];
    };
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
