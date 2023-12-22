{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      fd
      duf
      mpv
      tgpt
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
      ansible
      joshuto
      ripgrep
      nix-init
      htop-vim
      onefetch
      obsidian
      kdenlive
      libsecret
      libnotify
      hyprpicker
      ueberzugpp
      winetricks
      libreoffice
      virt-manager
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      rofi-wayland
      gnome.zenity
      android-tools
      prismlauncher
      webcord-vencord
      espanso-wayland
      telegram-desktop
      transmission-gtk
      libsForQt5.kdeconnect-kde
      wineWowPackages.stagingFull
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };

  imports = [
    ./programs/terminal/tmux
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
    ./programs/desktop/plasma

    ./containers/archlinux.nix

    ./themes
    ./devlop
  ];
}
