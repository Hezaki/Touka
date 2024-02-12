{
  xdg.configFile."hypr/autostart.sh".text = ''
    waybar &
    wl-copy &
    dunst &
    kdeconnect-cli &
    swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/canvasppuccin.png &
  '';
}
