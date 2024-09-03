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
      cinny-desktop
      microfetch
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
      gnome-boxes
    ];
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
      "cinny-4.1.0"
      "cinny-unwrapped-4.1.0"
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
