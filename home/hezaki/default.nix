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
        # tuba
        tesseract
        android-tools
        authenticator
        bleachbit
        bluetui
        cpu-x
        dtrx
        dua
        duf
        element-desktop
        evtest
        gcr
        gdb
        gnome-decoder
        gnome-secrets
        gomi
        gradia
        jq
        kdePackages.kdenlive
        krita
        libnotify
        libreoffice
        losslesscut-bin
        lutgen
        microfetch
        mousai
        nautilus
        nix-init
        obsidian
        onefetch
        # parsec-bin
        piper
        polkit_gnome
        ppsspp-sdl-wayland
        pywalfox-native
        ripdrag
        scrcpy
        swaybg
        swayimg
        teamspeak3
        varia
        via
        wiremix
        xwayland-satellite
        zenity
      ];
  };

  services.gnome-keyring.enable = true;

  programs.home-manager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;

      permittedInsecurePackages = [
        "electron-28.3.1"
        "mbedtls-2.28.10"
      ];
    };
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    settings = {
      builders-use-substitutes = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
