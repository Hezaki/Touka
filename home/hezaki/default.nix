{ pkgs, ... }: {
  home = {
    username = "hezaki";
    homeDirectory = "/home/hezaki";
    stateVersion = "23.11";
    packages = with pkgs; [
      gnome-decoder
      fd
      duf
      bun
      mpv
      cemu 
      ncdu
      cava
      btop
      loupe
      dconf
      socat
      swaybg
      scrcpy
      lutgen
      lutris
      weylus
      muzika
      blender
      zathura
      joshuto
      ripgrep
      nix-init
      htop-vim
      onefetch
      libsecret
      shell-gpt
      libnotify
      ueberzugpp
      blockbench
      libreoffice
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
      transmission-gtk
      gnome.gnome-boxes
    ];
  };

  nixpkgs.config = {
    allowBroken = true;
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
    # ./programs/terminal/espanso

    ./programs/graphical/mpv
    ./programs/graphical/foot
    ./programs/graphical/zathura
    ./programs/graphical/browser/firefox
    ./programs/graphical/discord 
    ./programs/graphical/telegram

    ./programs/desktop/anyrun
    ./programs/desktop/swaync
    ./programs/desktop/waybar
    ./programs/desktop/hyprland
    ./programs/desktop/hyprlock

    ./themes
    ./devlop
  ];
}
