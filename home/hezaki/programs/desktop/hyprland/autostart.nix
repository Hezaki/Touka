{
  xdg.configFile."hypr/autostart.conf".text = # hyprlang
    ''
      exec-once = pypr
      exec-once = waybar
      exec-once = swaync
      exec-once = batsignal
      exec-once = fusuma
      exec-once = nvim --headless "+call firenvim#install(0) | q"
    '';
}
