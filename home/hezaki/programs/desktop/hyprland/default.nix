{ pkgs, config, ... }: {
  imports = [ ./rules.nix ./binds.nix ./autostart.nix ];
  home.packages = with pkgs; [
    grimblast
    satty
    wl-clipboard 
    wl-screenrec
    hyprpicker
    hyprcursor
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    extraConfig = ''
      monitor=,preferred,auto,1

      exec = sh $HOME/.config/hypr/autostart.sh
      source = ./binds.conf
      source = ./rules.conf

      workspace = 1, monitor:eDP-1, default:true
      workspace = 2, monitor:eDP-1, default:true
      workspace = 3, monitor:eDP-1, default:true
      workspace = 4, monitor:eDP-1, default:true
      workspace = 5, monitor:eDP-1, default:true
      workspace = 6, monitor:eDP-1, default:true
      workspace = 7, monitor:eDP-1, default:true
      workspace = 8, monitor:eDP-1, default:true
      workspace = 9, monitor:eDP-1, default:true
      workspace = 10, monitor:eDP-1, default:true

      input {
        kb_layout = us,ru
        kb_options = grp:caps_toggle
        follow_mouse = 1
        sensitivity = 0.6
        repeat_rate = 50
        repeat_delay = 500
        touchpad {
          natural_scroll = false
          disable_while_typing = false
        }
      }

      cursor {
        enable_hyprcursor = true
        inactive_timeout = 1
      }

      device {
        name = tpps/2-elan-trackpoint
        accel_profile = flat
      }

      device {
        name = logitech-g304-1
        sensitivity = -1
      }

      general {
        gaps_in = 4
        gaps_out = 10
        border_size = 2
        col.active_border = rgb(${config.lib.stylix.colors.base00})
        col.inactive_border = rgb(${config.lib.stylix.colors.base03})
        layout = master
      }

      misc { 
        vfr = true
        enable_swallow = true
        disable_splash_rendering = true
        disable_autoreload = true
        disable_hyprland_logo = true
        animate_manual_resizes = true
        animate_mouse_windowdragging = true
        background_color = rgb(${config.lib.stylix.colors.base00})
      }

      dwindle {
        force_split = 2
        preserve_split = true
        default_split_ratio = 0.6
        use_active_for_splits = false
      }

      master {
        always_center_master = true
        mfact = 0.65
      }

      # group {
      #   col.border_active = rgb(3C3836) = true
      #   col.border_inactive = rgb(504945)
      #   groupbar {
      #     render_titles = false
      #     gradients = true
      #     col.active = rgb(3C3836)
      #     col.inactive = rgb(504945)
      #   }
      # }

      binds {
        workspace_back_and_forth = true
        allow_workspace_cycles = true
      }

      decoration {
        rounding = 2
        drop_shadow = true
        shadow_range = 5
        shadow_render_power = 1
        col.shadow = rgb(1C1D1D)
        blur {
          enabled = false
          new_optimizations = true
        }
        # screen_shader = ~/flux.glsl.mustache
      }

      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.0
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, myBezier, popin 80%
        animation = border, 1, 10, myBezier
        animation = fade, 1, 10, myBezier
        animation = workspaces, 1, 5, myBezier, slide
      }
    '';
  };
}
