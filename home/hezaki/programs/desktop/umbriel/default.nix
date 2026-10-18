{
  inputs,
  lib,
  config,
  ...
}:

{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      general = {
        autostart = [
          "noctalia"
        ];

        xwayland = true;
        show_cheatsheet = false;
        focus_on_activate = false;
        honor_restored_maximize = false;
      };

      colors = {
        background = "#${base00}FF";
        text_primary = "#${base04}FF";
        text_muted = "#${base08}FF";
        accent_primary = "#${base01}FF";
        accent_secondary = "#${base04}FF";
        warning = "#${base09}";
        error = "#${base08}";
        insert_hint = "#7FC8FF80";
        backdrop = "#${base00}FF";
        shadow = "#000000";

        border = {
          focused = "#${base00}";
          unfocused = "#${base03}";
          scratchpad_focused = "#${base0C}";
          scratchpad_unfocused = "#${base00}";
          outer = "#${base01}";
        };
      };

      appearance = {
        prefer_no_csd = true;
        border_width = 1;
        corner_radius = 23;
        drag_opacity = 0.75;

        blur = {
          enabled = true;
          optimized = true;
          passes = 2;
          radius = 3;
          noise = 0.09;
          brightness = 0.9;
          contrast = 0.9;
          saturation = 1.5;
        };

        shadow = {
          enabled = true;
          softness = 20;
          offset_x = 0;
          offset_y = 4;
        };
      };

      layer_rule = [
        {
          match = {
            namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";
          };

          blur = true;
          blur_optimized = false;
          blur_ignore_alpha = 0.5;
        }
      ];

      input = {
        keyboard = {
          layout = "us,ru";
          variant = "";
          options = "grp:caps_toggle";
          repeat_rate = 50;
          repeat_delay = 500;
        };

        mouse = {
          natural_scroll = false;
          accel_profile = "flat";
          sensitivity = -0.87;
          scroll_wheel_step = 60;
        };

        cursor = {
          theme = "";
          size = 24;
          hardware_cursor = true;
          follows_focus = false;
        };

        focus = {
          follows_mouse = false;
        };
      };

      output = {
        "DP-2" = {
          enabled = true;
          mode = "3440x1440@120";
          scale = 1;
          vrr = "fullscreen";
          tearing = true;
          min_workspaces = 3;
        };

        "eDP-1" = {
          enabled = false;
          mode = "1920x1080@60";
          scale = 1;
          tearing = true;
          min_workspaces = 3;
        };
      };

      overview = {
        zoom = 0.7;
        shortcuts = true;
        shortcut_keys = "asdfghjkl";
      };

      layout = {
        mode = "scrolling";
        scrolling = {
          default_extent_fraction = 0.66667;
          center_underfull_strip = true;
          center_focused = "never";
        };

        gap = 10;

        extent_presets = [
          0.33333
          0.5
          0.66667
          0.8
        ];

        struts = {
          left = 0;
          right = 0;
          top = 1;
          bottom = 1;
        };
      };

      hot_corners.top_left = {
        enabled = true;
        delay_ms = 100;
        action = "overview-toggle";
      };

      keybinds = lib.mkMerge [
        (lib.concatMapAttrs
          (key: command: {
            "Mod+${key}" = command;
          })
          {
            "MouseMiddle" = "layout-scroll-drag";
            "Return" = "spawn:foot";
            "W" = "window-close";
            "S" = "window-toggle-floating";
            "F" = "window-toggle-fullscreen";
            "M" = "window-toggle-maximize";
            "R" = "window-cycle-primary-extent";
            "Space" = "overview-toggle";
            "P" = "spawn:hyprpicker -an";
            "L" = "window-focus-next";
            "H" = "window-focus-previous";

            "D" = "spawn:noctalia msg panel-toggle launcher";
            "Minus" = "spawn:noctalia msg brightness-up";
            "Equal" = "spawn:noctalia msg brightness-down";
            "Print" = "spawn:noctalia msg screenshot-region";
            "Ctrl+Print" = "spawn:noctalia msg screenshot-annotate";
          }
        )

        {
          "Print" = "spawn:noctalia msg screenshot-fullscreen";
        }

        (lib.genAttrs (map (n: "Mod+${toString n}") (lib.range 1 3)) (
          n: "workspace-switch:${lib.removePrefix "Mod+" n}"
        ))

        (lib.listToAttrs (
          map (n: {
            name = "Mod+Shift+${toString n}";
            value = "window-move-to-workspace:${toString n}";
          }) (lib.range 1 3)
        ))
      ];
    };
  };
}
