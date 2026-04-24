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

    packages =
      with pkgs;
      with inputs;
      [
        pywalfox-native
        tuba
        tg-ws-proxy.packages.${stdenv.hostPlatform.system}.default
        evtest
        authenticator
        microfetch
        kdePackages.kdenlive
        cpu-x
        smile
        krita
        # (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
        ppsspp-sdl-wayland
        obsidian
        lunar-client.packages.${stdenv.hostPlatform.system}.default
        dua
        duf
        easyeffects
        gcr
        gdb
        glfw
        jq
        libnotify
        libreoffice
        lutgen
        lutris
        nix-init
        onefetch
        pulsemixer
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
        bleachbit
        xwayland-satellite
        batsignal
        powermode-indicator
        gnome-decoder
        youtube-music
        nautilus
        via
        aider-chat
        piper
      ];
  };

  services.gnome-keyring.enable = true;

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
      "jitsi-meet-1.0.8043"
      "mbedtls-2.28.10"
    ];
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
