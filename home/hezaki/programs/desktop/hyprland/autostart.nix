{
  xdg.configFile."hypr/autostart.sh".text = ''
    waybar &
    swaync &
    batsignal &
    swaybg -m fill -i /etc/nixos/home/hezaki/themes/images/wp.png &
  '';
}
