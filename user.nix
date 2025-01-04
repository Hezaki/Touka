{ pkgs, inputs, ... }:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  # оригинальное название пиздец
  home.username = "hezaki";
  home.homeDirectory = "/home/hezaki";
  home.stateVersion = "23.11";
  home.packages = with pkgs; [
    fastfetch
    keepassxc
    telegram-desktop
    libreoffice-fresh
    vesktop
    chromium
    okular
    bottles
    unrar_6
    vlc
    yt-dlp
    osmo
    transmission_4-qt
    gimp
    prismlauncher
    obs-studio
    btop
    nekoray
    ptyxis

  ];
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
