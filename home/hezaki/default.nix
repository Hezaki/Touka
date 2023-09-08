{ pkgs, inputs, ... }: let
  username = "hezaki";
in {
  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs; with rPackages; [
      home-manager
      hyprland
      xdg-desktop-portal-gtk
      android-tools
      inxi
      imagemagick
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
      nix-prefetch
      translate-shell
      libnotify
      scrcpy
      zathura
      gnome.zenity
      ppsspp-sdl-wayland
      transmission-gtk
      mpv
      ueberzugpp
      prismlauncher
      glfw-wayland
      hyprpicker
      wl-clipboard
      wf-recorder
      appimage-run
      lzip
      libreoffice
    ];
  };

  nixpkgs = {
    overlays = [
      inputs.chaotic.overlays.default
      inputs.nur.overlay
    ];
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  imports = [
    ./programs/cui/tmux
    ./programs/cui/shell
    ./programs/cui/ranger
    ./programs/cui/editors/neovim
    ./programs/cui/neofetch

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
    ./virtualisation/qemu

    ./themes
    ./devlop
  ];
}
