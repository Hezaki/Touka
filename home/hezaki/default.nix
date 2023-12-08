{ pkgs, inputs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      fd
      duf
      mpv
      ncdu
      inxi
      cava
      dconf
      socat
      slurp
      swaybg
      scrcpy
      lutgen
      swayimg
      zathura
      ripgrep
      nix-init
      htop-vim
      onefetch
      xdg-utils
      libnotify
      winetricks
      hyprpicker
      ueberzugpp
      libreoffice
      wf-recorder
      eww-wayland
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      rofi-wayland
      gnome.zenity
      android-tools
      prismlauncher
      webcord-vencord
      telegram-desktop
      transmission-gtk
      gnome.gnome-boxes
      wineWowPackages.stagingFull
      inputs.anyrun.packages.${system}.anyrun
      inputs.anyrun.packages.${system}.applications
    ];
  };

  imports = [
    ./programs/terminal/tmux
    ./programs/terminal/ranger
    ./programs/terminal/fastfetch
    ./programs/terminal/shell/zsh
    ./programs/terminal/shell/translate-shell
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
    ./programs/desktop/gtklock

    ./themes
    ./devlop
  ];
}
