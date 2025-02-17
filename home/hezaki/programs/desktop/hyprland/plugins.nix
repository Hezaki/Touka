{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    # hyprfocus
    hypr-dynamic-cursors
  ];
  xdg.configFile."hypr/plugins.conf".text = ''
    plugin {
      hyprfocus:enabled = true
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
