{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      firefoxpwa
      fd
      duf
      bun
      mpv
      lsix
      ncdu
      cava
      piper
      dconf
      socat
      swaybg
      scrcpy
      lutgen
      lutris
      swayimg
      blender
      zathura
      nix-init
      htop-vim
      onefetch
      libnotify
      ueberzugpp
      libreoffice
      vulkan-tools
      glfw-wayland
      appimage-run
      home-manager
      nix-prefetch
      gnome.zenity
      android-tools
      prismlauncher
      webcord-vencord
      transmission-gtk
      gnome.gnome-boxes
    ];
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.1"
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
    ./programs/terminal/lsd
    ./programs/terminal/git
    ./programs/terminal/tmux
    ./programs/terminal/btop
    ./programs/terminal/zoxide
    ./programs/terminal/fastfetch
    ./programs/terminal/ripgrep
    ./programs/terminal/shell/zsh
    ./programs/terminal/shell/translate-shell
    ./programs/terminal/editors/emacs

    ./programs/graphical/mpv
    ./programs/graphical/foot
    ./programs/graphical/zathura
    ./programs/graphical/browser/firefox
    ./programs/graphical/vesktop
    ./programs/graphical/telegram
    ./programs/graphical/blockbench
    ./programs/graphical/prismlauncher
    ./programs/graphical/youtube-music
    ./programs/graphical/mangohud

    ./programs/desktop/portals
    ./programs/desktop/anyrun
    ./programs/desktop/swaync
    ./programs/desktop/waybar
    ./programs/desktop/hyprland
    ./programs/desktop/hyprlock
    ./programs/desktop/xremap

    ./themes
    ./devlop
  ];
}
