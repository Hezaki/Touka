{
  xdg.configFile."hypr/autostart.conf".text = # hyprlang
    ''
      exec-once = waybar
      exec-once = swaync
      exec-once = batsignal
      # exec-once = fusuma
      exec-once = nvim --headless "+call firenvim#install(0) | q"
      exec-once = flatpak run pw.mmk.OpenFreebuds
      exec-once = wl-paste --watch cliphist store
    '';
}
