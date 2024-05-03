{ pkgs, ... }: {
  home.packages = with pkgs; [
    hyprlock
  ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      path = screenshot 
      blur_passes = 2
      blur_size = 3
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    input-field {
      size = 200, 50
      outer_color = rgb(504945)
      inner_color = rgb(282828)
      font_color = rgb(EBDBB2)
      rounding = -1
      halign = center
      valign = center
    }

    label {
      text = What do you need from me!
      color = rgb(EBDBB2)
      font_size = 20
      font_family = JetBrainsMono
      position = 745, -510
      halign = center
      valign = center
    }

    label {
      text = $TIME
      color = rgb(EBDBB2)
      font_size = 20
      font_family = JetBrainsMono
      position = -900, -510
      halign = center
      valign = center
    }
  '';
}
