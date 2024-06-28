{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      easyeffects
      fd
      duf
      bun
      mpv
      lsix
      ncdu
      cava
      piper
      dconf
      socat
      swaybg
      scrcpy
      lutgen
      lutris
      bottles
      swayimg
      blender
      zathura
      nix-init
      htop-vim
      onefetch
      libnotify
      ueberzugpp
      libreoffice
      vulkan-tools
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      gnome.zenity
      android-tools
      prismlauncher
      webcord-vencord
      transmission-gtk
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
