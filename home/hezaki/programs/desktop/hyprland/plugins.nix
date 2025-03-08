{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    # hyprfocus
    hypr-dynamic-cursors
    csgo-vulkan-fix
  ];
  xdg.configFile."hypr/plugins.conf".text = ''
    plugin {
      csgo-vulkan-fix {
        res_w = 1280
        res_h = 960
        class = SDL Application
        fix_mouse = true
      } 
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
