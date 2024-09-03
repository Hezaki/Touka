{
  security = {
    doas = {
      enable = true;
      extraConfig = ''
        permit persist keepenv :wheel
        permit nopass hezaki as root cmd light
        permit nopass hezaki as root cmd tee /sys/class/leds/platform\:\:micmute/brightness
      '';
    };
    sudo.enable = true;
  };
}
