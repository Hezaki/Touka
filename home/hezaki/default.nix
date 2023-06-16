{ config, pkgs, inputs, ... }: let
  username = "hezaki";
in {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    packages = with pkgs; [
      home-manager
      android-tools
      dconf
      pass
      inkscape
      dunst
      rofi-wayland
      imv
      distrobox 
      joplin-desktop
      telegram-desktop
      slurp
      grim
      swaybg
      libnotify
      scrcpy
      ueberzugpp
      zathura
      gnome.zenity
      ppsspp-sdl-wayland
      transmission-gtk
      mpv
      prismlauncher
      hyprpicker
      wl-clipboard
      wf-recorder
      gtkcord4
    ];
  };

  imports = [
    ./devlop/C
    ./devlop/Java
    ./devlop/Python
    ./devlop/JavaScript

    ./programs/CUI/tmux
    ./programs/CUI/shell
    ./programs/CUI/ranger
    ./programs/CUI/editors/neovim
    ./programs/CUI/neofetch

    ./programs/GUI/gtklock
    ./programs/GUI/zathura
    ./programs/GUI/hyprland 
    ./programs/GUI/mpv
    ./programs/GUI/waybar
    ./programs/GUI/firefox
    ./programs/GUI/foot
    ./programs/GUI/rofi
    ./programs/GUI/dunst

    ./virtualisation/containers

    ./themes/themes.nix
   ];
}
