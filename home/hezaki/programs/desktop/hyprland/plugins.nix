{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins =
    with pkgs.hyprlandPlugins;
    with inputs;
    [
      hypr-dynamic-cursors
      csgo-vulkan-fix
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

  xdg.configFile."hypr/plugins.conf".text = # hyprlang
    ''
      plugin {
        csgo-vulkan-fix {
          res_w = 1280
          res_h = 960
          class = SDL Application
          fix_mouse = true
        } 

        dynamic-cursors {
          enabled = true
          mode = tilt
          threshold = 1
          shake:enabled = true

          stretch {
            limit = 6000
            function = quadratic
          }
        }

        hyprcursor:enabled = true
      }
    '';
}
