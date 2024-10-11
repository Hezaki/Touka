{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprfocus
    hypr-dynamic-cursors
  ];
  xdg.configFile."hypr/plugins.conf".text = ''
  plugin {
    hyprfocus {
      enabled = true
      keyboard_focus_animation = shrink
      mouse_focus_animation = shrink
      bezier = bezIn, 0.5,0.0,1.0,0.5
      bezier = bezOut, 0.0,0.5,0.5,1.0
      shrink {
        shrink_percentage = 0.8
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
