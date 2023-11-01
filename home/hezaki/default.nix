{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      duf
      mpv
      ncdu
      inxi
      dconf
      socat
      slurp
      swaybg
      scrcpy
      lutgen
      wayshot
      swayimg
      zathura
      nix-init
      # obsidian
      libnotify
      winetricks
      hyprpicker
      ueberzugpp
      wf-recorder
      libreoffice
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      rofi-wayland
      gnome.zenity
      prismlauncher
      translate-shell
      webcord-vencord
      telegram-desktop
      transmission-gtk
      wineWowPackages.stagingFull
    ];
  };

  imports = [
    ./programs/terminal/tmux
    ./programs/terminal/neofetch
    ./programs/terminal/shell/zsh
    ./programs/terminal/editors/neovim

    ./programs/graphical/mpv
    ./programs/graphical/foot
    ./programs/graphical/zathura
    ./programs/graphical/firefox
    ./programs/graphical/webcord 

    ./programs/desktop/rofi
    ./programs/desktop/dunst
    ./programs/desktop/waybar
    ./programs/desktop/hyprland

    ./themes
    ./devlop
  ];
}
