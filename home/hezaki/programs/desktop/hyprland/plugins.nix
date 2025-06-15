{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hypr-dynamic-cursors
    csgo-vulkan-fix
    hyprsplit
    inputs.hyprhook.packages.${pkgs.system}.hyprhook
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

        hyprhook {
          focusedMon = $XDG_CONFIG_HOME/hypr/scripts/rules.sh
        }

        hyprcursor:enabled = true
      }
    '';
}
