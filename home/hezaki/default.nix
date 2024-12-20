{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nur.modules.homeManager.default
    ./programs
    ./themes
  ];

  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "24.11";
    packages = with pkgs; [
      nix-init
      gnome-weather
      amneziawg-go
      amneziawg-tools
      (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
      xournalpp
      (obsidian.override { commandLineArgs = [ "--ozone-platform=wayland" ]; })
      xdg-utils
      tgpt
      microfetch
      gdb
      duf
      lsix
      dua
      piper
      zenity
      swaybg
      scrcpy
      inputs.chaotic.packages.${system}.proton-ge-custom
      lutgen
      lutris
      swayimg
      onefetch
      libnotify
      libreoffice
      glfw-wayland
      appimage-run
      home-manager
      transmission_4-gtk
    ];
  };

  xdg = with config.home; {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
      music = null;
      download = "${homeDirectory}/Downloads";
      documents = "${homeDirectory}/Documents";
      videos = "${homeDirectory}/Media/Videos";
      pictures = "${homeDirectory}/Media/Screenshots";
      extraConfig = {
        XDG_REPO_DIR = "${homeDirectory}/Downloads/Repositories";
        XDG_PIC_DIR = "${homeDirectory}/Downloads/Pictures";
        XDG_VID_DIR = "${homeDirectory}/Downloads/Videos";
      };
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
      "cinny-4.2.1"
      "cinny-unwrapped-4.2.1"
    ];
    overlays = [ inputs.nur.overlay ];
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs-unstable}" ];
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
