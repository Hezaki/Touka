{ pkgs, ... }: {
  home.packages = with pkgs; with gnome; [
    mutter
    gnome-shell
    gnome-session
    gnome-control-center
    gnome-terminal
    gnome-settings-daemon
    zenity
    nautilus
    gnome-weather
    gnome-calculator
    gnome-calendar
    gnome-maps
    gnome-clocks
    loupe
  ];
}
