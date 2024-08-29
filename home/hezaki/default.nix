{ pkgs, inputs, pkgsStable, ... }:
{
  imports = [
    ./programs
    ./themes
    ./devlop
  ];

  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "24.05";
    packages = with pkgs; [
      pkgsStable.cinny-desktop
      boxes
      gdb
      duf
      lsix
      ncdu
      cava
      piper
      dconf
      socat
      zenity
      swaybg
      scrcpy
      lutgen
      lutris
      trashy
      swayimg
      blender-hip
      onefetch
      libnotify
      ueberzugpp
      libreoffice
      glfw-wayland
      appimage-run
      home-manager
      android-tools
      badlion-client
      transmission_4-gtk
      gnome.gnome-boxes
    ];
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
    ];
    overlays = [
      inputs.nur.overlay
    ];
  };

  nix = {
    package = pkgs.nix;
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
