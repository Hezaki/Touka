{ config, lib, ... }:
{
  programs.hyprlock = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      background = lib.mkForce {
        monitor = "";
        path = "screenshot";
        blur_passes = 3;
        blur_size = 3;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };

      input-field = lib.mkForce [
        {
          monitor = "";
          size = "150, 50";
          outline_thickness = 0;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgb(${base06})";
          inner_color = "rgb(${base06})";
          font_color = "rgb(${base00})";
          fade_on_empty = false;
          font_family = "Inter Medium";
          placeholder_text = "What do you need from me!";
          hide_input = false;
          check_color = "rgb(${base0E})";
          fail_color = "rgb(${base08})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${base0B})";
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          text = "$TIME";
          color = "rgb(${base06})";
          font_size = 130;
          font_family = "Lato Black";
          position = "0, 70";
          halign = "center";
          valign = "center";
        }
        {
          text = "cmd[update:43200000] echo \"$(date +\"%e %B %A\")\"";
          color = "rgb(${base06})";
          font_family = "Inter Semibold";
          font_size = 18;
          position = "0, -40";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
