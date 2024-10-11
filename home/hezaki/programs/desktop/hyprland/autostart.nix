{
  xdg.configFile."hypr/autostart.conf".text = ''
    exec = waybar
    exec = swaync
    exec = batsignal
    exec = swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/wp.png
  '';
}
