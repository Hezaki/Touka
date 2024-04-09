{ pkgs, inputs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      fd
      duf
      bun
      mpv
      ncdu
      cava
      loupe
      dconf
      socat
      krita
      swaybg
      scrcpy
      lutgen
      lutris
      blender
      zathura
      joshuto
      ripgrep
      bottles
      nix-init
      htop-vim
      onefetch
      libsecret
      libnotify
      ueberzugpp
      libreoffice
      virt-manager
      vulkan-tools
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      gnome.zenity
      youtube-music
      android-tools
      prismlauncher
      webcord-vencord
      espanso-wayland
      telegram-desktop
      transmission-gtk
      libsForQt5.kdeconnect-kde
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
    ./programs/terminal/bat
    ./programs/terminal/fzf
    ./programs/terminal/git
    ./programs/terminal/tmux
    ./programs/terminal/fastfetch
    ./programs/terminal/shell/zsh
    ./programs/terminal/shell/translate-shell
    ./programs/terminal/editors/emacs

    ./programs/graphical/mpv
    ./programs/graphical/foot
    ./programs/graphical/zathura
    ./programs/graphical/firefox
    ./programs/graphical/webcord 
    ./programs/graphical/telegram
    ./programs/graphical/obs-studio

    ./programs/desktop/anyrun
    ./programs/desktop/swaync
    ./programs/desktop/waybar
    ./programs/desktop/ags
    ./programs/desktop/hyprland
    ./programs/desktop/gtklock

    ./containers/archlinux.nix
    # ./programs/flatpak

    ./themes
    ./devlop
  ];
}
