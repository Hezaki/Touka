{
  xdg.configFile."hypr/autostart.sh".text = ''
    waybar &
    wl-copy &
    swaync &
    kdeconnect-cli &
    swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/anyame.png &
  '';
}
