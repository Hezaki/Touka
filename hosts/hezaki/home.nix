{ config, pkgs, inputs, ... }: let
  username = "hezaki";
in {
  home-manager.users.${username} = {
    home = {
      username = username;
      homeDirectory = "/home/${username}";
      stateVersion = "23.05";
      packages = with pkgs; [
        home-manager
        android-tools
        dconf
        inkscape
        dunst
        rofi-wayland
        imv
        gtklock
        distrobox 
        joplin-desktop
        telegram-desktop
        slurp
        grim
        swaybg
        libnotify
        scrcpy
        ueberzugpp
        zathura
        gnome.zenity
        ppsspp-sdl-wayland
        transmission-gtk
        obs-studio
        mpv
        prismlauncher
        proton-ge-custom
      ];
    };

  imports = [
    ../../programs/foot/default.nix
    ../../programs/shell/zsh/zsh.nix
    ../../programs/ranger/default.nix
    ../../programs/hyprland/default.nix
    ../../programs/editors/neovim/default.nix
    ../../programs/firefox/default.nix
    ../../programs/tmux/default.nix
    ../../programs/rofi/default.nix
    ../../programs/dunst/default.nix
    ../../programs/zathura/default.nix
    ../../programs/neofetch/default.nix
    ../../programs/waybar/default.nix
    ../../programs/mpv/default.nix
    ../../devlop/C/default.nix
    ../../devlop/Java/default.nix
    ../../devlop/Python/default.nix
    ../../devlop/JavaScript/default.nix
    ../../virtualisation/containers/containers.nix
    ./tools/themes.nix
   ];
  };
}
