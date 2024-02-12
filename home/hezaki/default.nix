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
      cava
      dconf
      socat
      slurp
      krita
      swaybg
      scrcpy
      lutgen
      swayimg
      zathura
      ansible
      joshuto
      flatpak
      ripgrep
      nix-init
      htop-vim
      onefetch
      obsidian
      libsecret
      libnotify
      ueberzugpp
      winetricks
      libreoffice
      virt-manager
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      gnome.zenity
      android-tools
      prismlauncher
      webcord-vencord
      espanso-wayland
      telegram-desktop
      transmission-gtk
      libsForQt5.kdenlive
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

  nix = {
    package = pkgs.nix;
    settings = {
      builders-use-substitutes = true;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  imports = [
    ./programs/terminal/tmux
    ./programs/terminal/fastfetch
    ./programs/terminal/shell/zsh
    ./programs/terminal/shell/translate-shell
    ./programs/terminal/editors/neovim
    ./programs/terminal/editors/emacs

    ./programs/graphical/mpv
    ./programs/graphical/foot
    ./programs/graphical/zathura
    ./programs/graphical/firefox
    ./programs/graphical/webcord 
    ./programs/graphical/telegram

    ./programs/desktop/anyrun
    ./programs/desktop/dunst
    ./programs/desktop/waybar
    # ./programs/desktop/ags
    ./programs/desktop/hyprland
    ./programs/desktop/gtklock

    ./containers/archlinux.nix
    ./programs/flatpak

    ./themes
    ./devlop
  ];
}
