{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      obs-studio
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
      swayimg
      blender
      onefetch
      libnotify
      ueberzugpp
      libreoffice
      glfw-wayland
      appimage-run
      home-manager
      android-tools
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
  };

  nix = {
    package = pkgs.nix;
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  imports = [
    ./programs
    ./themes
    ./devlop
  ];
}
