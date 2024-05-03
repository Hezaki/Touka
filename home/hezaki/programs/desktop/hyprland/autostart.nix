{
  xdg.configFile."hypr/autostart.sh".text = ''
    pypr &
    waybar &
    wl-copy &
    swaync &
    swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/anyame.png &
  '';
}
