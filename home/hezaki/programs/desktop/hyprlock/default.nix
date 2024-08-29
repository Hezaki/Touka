{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    hyprlock
  ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = /etc/nixos/home/hezaki/themes/images/wp.png
      blur_passes = 3
      blur_size = 3
      noise = 0.0117
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    input-field {
      size = 200, 50
      outer_color = rgb(${config.lib.stylix.colors.base02})
      inner_color = rgb(${config.lib.stylix.colors.base00})
      font_color = rgb(${config.lib.stylix.colors.base06})
      rounding = -1
      halign = center
      valign = center
    }

    label {
      text = What do you need from me!
      color = rgb(${config.lib.stylix.colors.base06})
      font_size = 20
      font_family = JetBrainsMono
      position = 745, -510
      halign = center
      valign = center
    }

    label {
      text = $TIME
      color = rgb(${config.lib.stylix.colors.base06})
      font_size = 20
      font_family = JetBrainsMono
      position = -900, -510
      halign = center
      valign = center
    }
  '';
}
