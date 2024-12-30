{
  xdg.configFile."hypr/autostart.conf".text = ''
    exec-once = waybar
    exec-once = swaync
    exec-once = batsignal
    exec-once = swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/wp.png
    exec-once = blueman-applet
  '';
}
