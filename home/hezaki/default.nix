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
    stateVersion = "24.11";
    packages = with pkgs; [
      # (pkgs.callPackage ./programs/terminal/anicliru/anicli-ru.nix { })
      (obsidian.override { commandLineArgs = [ "--ozone-platform=wayland" ]; })
      amneziawg-go
      amneziawg-tools
      badlion-client
      dua
      duf
      foliate
      gdb
      glfw-wayland
      home-manager
      libnotify
      libreoffice
      lsix
      lutgen
      lutris
      microfetch
      nix-init
      onefetch
      pavucontrol
      piper
      scrcpy
      swaybg
      swayimg
      tgpt
      thunderbird
      transmission_4-gtk
      xdg-utils
      xournalpp
      zenity
    ];
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
