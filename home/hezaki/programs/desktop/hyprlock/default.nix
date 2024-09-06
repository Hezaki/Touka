{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        path = "/etc/nixos/home/hezaki/themes/images/wp.png";
        blur_passes = 3;
        blur_size = 3;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      input-field = [
        {
          size = "200, 50";
          outline_thickness = 0;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(${config.lib.stylix.colors.base06})";
          inner_color = "rgb(${config.lib.stylix.colors.base06})";
          font_color = "rgb(${config.lib.stylix.colors.base00})";
          fade_on_empty = false;
          font_family = "LatoBlackNerdFont Medium";
          placeholder_text = "What do you need from me!";
          hide_input = false;
          check_color = "rgb(${config.lib.stylix.colors.base01})";
          fail_color = "rgb(${config.lib.stylix.colors.base01})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${config.lib.stylix.colors.base08})";
          position = "0, -195";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          text = "cmd[update:43200000] echo \"$(date +\"%M\")\"";
          color = "rgb(${config.lib.stylix.colors.base06})";
          font_size = 150;
          font_family = "LatoBlackNerdFont Bold";
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:1000] echo \"$(date +\"%H\")\"";
          color = "rgb(${config.lib.stylix.colors.base06})";
          font_size = 150;
          font_family = "LatoBlackNerdFont Bold";
          position = "0, 170";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:43200000] echo \"$(date +\"%e %B %A\")\"";
          color = "rgb(${config.lib.stylix.colors.base06})";
          font_family = "LatoBlackNerdFont SmBd";
          font_size = 20;
          position = "0, -130";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
