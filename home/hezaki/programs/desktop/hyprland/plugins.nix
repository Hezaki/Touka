{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprexpo
    hyprfocus
    hypr-dynamic-cursors
  ];
  xdg.configFile."hypr/plugins.conf".text = ''
  plugin {
    hyprexpo {
      columns = 3
      gap_size = 5
      bg_col = rgb(${config.lib.stylix.colors.base00})
      workspace_method = first m1
    }
    hyprfocus {
      enabled = true
      keyboard_focus_animation = flash
      mouse_focus_animation = flash
      bezier = bezIn, 0.5,0.0,1.0,0.5
      bezier = bezOut, 0.0,0.5,0.5,1.0
      flash {
        flash_opacity = 0.7
        in_bezier = bezIn
        in_speed = 0.5
        out_bezier = bezOut
        out_speed = 3
      }
    }
    dynamic-cursors {
      enabled = true
      mode = tilt
      threshold = 1
      stretch {
        limit = 6000
        function = quadratic
      }
      shake:enabled = false
    }
  }
'';
}
