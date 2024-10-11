{ pkgs, inputs, config, ... }:
{
  imports = [
    inputs.nur.nixosModules.nur
    ./programs
    ./themes
  ];

  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "24.05";
    packages = with pkgs; [
      config.nur.repos.ataraxiasjel.waydroid-script
      monero-gui
      (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
      # cinny-desktop
      tectonic
      obsidian
      xdg-utils
      tgpt
      microfetch
      boxes
      gdb
      duf
      lsix
      dua
      piper
      zenity
      swaybg
      scrcpy
      lutgen
      lutris
      swayimg
      onefetch
      libnotify
      ueberzugpp
      libreoffice
      glfw-wayland
      appimage-run
      home-manager
      transmission_4-gtk
    ];
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      download = "${config.home.homeDirectory}/Downloads";
      documents = "${config.home.homeDirectory}/Documents";
      videos = "${config.home.homeDirectory}/Media/Videos";
      pictures = "${config.home.homeDirectory}/Media/Screenshots";
      templates = null;
      publicShare = null;
      music = null;
      extraConfig = {
        XDG_REPO_DIR = "${config.home.homeDirectory}/Downloads/Repositories";
        XDG_PIC_DIR = "${config.home.homeDirectory}/Downloads/Pictures";
        XDG_VID_DIR = "${config.home.homeDirectory}/Downloads/Videos";
      };
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [ "electron-28.3.1" ];
    overlays = [ inputs.nur.overlay ];
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
