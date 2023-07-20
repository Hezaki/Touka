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
      dconf
      pass
      inkscape
      blockbench-electron
      rofi-wayland
      eww-wayland
      imv
      distrobox
      dunst
      kotatogram-desktop
      telegram-desktop
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
      hyprpicker
      wl-clipboard
      wf-recorder
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
    ./programs/gui/mpv
    ./programs/gui/waybar
    ./programs/gui/eww
    ./programs/gui/firefox
    ./programs/gui/foot
    ./programs/gui/rofi
    ./programs/gui/dunst

    ./virtualisation/containers

    ./themes/themes.nix
  ];
}
