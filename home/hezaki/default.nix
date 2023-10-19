{ pkgs, inputs, ... }: let
  username = "hezaki";
in {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; [
      home-manager
      nix-init
      hyprland
      android-tools
      inxi
      duf
      ncdu
      fd
      dconf
      socat
      pass
      inkscape
      rofi-wayland
      swayimg
      distrobox
      dunst
      telegram-desktop
      webcord-vencord
      slurp
      grim
      swaybg
      nix-prefetch
      translate-shell
      libnotify
      scrcpy
      zathura
      gnome.zenity
      transmission-gtk
      mpv
      ueberzugpp
      prismlauncher
      glfw-wayland
      hyprpicker
      wf-recorder
      appimage-run
      libreoffice
      lutgen
      wineWowPackages.stagingFull
      winetricks
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1u"
        "openssl-1.1.1w"
      ];
      overlays = [
        inputs.chaotic.overlays.default
        inputs.nurpkgs.overlay
      ];
    };
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  imports = [
    ./programs/cui/tmux
    ./programs/cui/shell
    ./programs/cui/neofetch
    ./programs/cui/editors/neovim

    ./programs/gui/zathura
    ./programs/gui/mpv
    ./programs/gui/firefox
    ./programs/gui/foot
    ./programs/gui/webcord 

    ./programs/wm/dunst
    ./programs/wm/rofi
    ./programs/wm/waybar
    ./programs/wm/hyprland
    ./programs/wm/gnome

    ./virtualisation/containers

    ./themes
    ./devlop
  ];
}
