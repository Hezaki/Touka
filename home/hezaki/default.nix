{
  config,
  pkgs,
  inputs,
  ...
}: let
  username = "hezaki";
in {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    packages = with pkgs; [
      home-manager
      hyprland
      xdg-desktop-portal-gtk
      android-tools
      inxi
      dconf
      socat
      pass
      inkscape
      blockbench-electron
      rofi-wayland
      eww-wayland
      swayimg
      distrobox
      dunst
      telegram-desktop
      webcord-vencord
      logseq
      slurp
      grim
      swaybg
      cliphist
      translate-shell
      libnotify
      scrcpy
      zathura
      gnome.zenity
      ppsspp-sdl-wayland
      transmission-gtk
      mpv
      prismlauncher
      glfw-wayland
      hyprpicker
      wl-clipboard
      wf-recorder
      appimage-run
      wineWowPackages.waylandFull
    ];
  };

  imports = [
    ./devlop/C
    ./devlop/Java
    ./devlop/Python
    ./devlop/JavaScript

    ./programs/cui/tmux
    ./programs/cui/shell
    ./programs/cui/ranger
    ./programs/cui/editors/neovim
    ./programs/cui/neofetch

    ./programs/gui/zathura
    ./programs/gui/hyprland
    ./programs/gui/gnome 
    ./programs/gui/mpv
    ./programs/gui/waybar
    ./programs/gui/firefox
    ./programs/gui/foot
    ./programs/gui/rofi
    ./programs/gui/dunst

    ./virtualisation/containers

    ./themes/themes.nix
  ];
}
