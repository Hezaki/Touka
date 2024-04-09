{ inputs, pkgs, ... }: {
  imports = [ ./binds.nix ./autostart.nix ];
  home.packages = with pkgs; [
    grimblast
    wl-clipboard 
    wf-recorder
    hyprpicker
    hyprcursor
    waypaper
    gtklock
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    enableNvidiaPatches = false;
    systemd.enable = false;
    extraConfig = 
      ''
      monitor=,preferred,auto,1

      exec = sh $HOME/.config/hypr/autostart.sh
      source = ./binds.conf

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

      # rules
      windowrule = float, title:^(Library)$
      windowrule = move center 1, title:^(Library)$
			windowrule = size 482 271, title:^(Picture-in-Picture)$
			windowrule = move 14 12, title:^(Picture-in-Picture)$
      windowrule = float, title:^(Picture-in-Picture)$
      windowrule = workspace 2, firefox
      windowrule = workspace 3, org.telegram.desktop
      windowrule = workspace 4, WebCord
      windowrule = workspace 5, virt-manager
      windowrule = workspace 5, org.prismlauncher.PrismLauncher
      windowrule = workspace 5, libreoffice-writer
      windowrule = workspace 5, steam
      windowrule = workspace 5, lutris
      windowrule = workspace 6, org.pwmt.zathura 
      windowrule = workspace 7, emacs
      windowrule = workspace 8, blender
      windowrule = workspace 9, transmission-gtk
      windowrule = workspace 10, YouTube Music

      input {
        kb_layout = us,ru
        kb_options = grp:caps_toggle
        follow_mouse = 1
        sensitivity = -0.5
        repeat_rate = 50
        repeat_delay = 500
        force_no_accel = true
        touchpad {
          natural_scroll = false
          disable_while_typing = false
        }
      }

			device {
				name = 2-elan-trackpoint
				accel_profile = custom 1 1.2 1.5
			}
	
      general {
        gaps_in = 4
        gaps_out = 10
        border_size = 2
        col.active_border = rgb(282828)
        col.inactive_border = rgb(504945)
        layout = dwindle
        cursor_inactive_timeout = 3
        apply_sens_to_raw = 0
      }

      misc { 
        vfr = true
        enable_swallow = true
        disable_splash_rendering = true
        animate_manual_resizes = true
        animate_mouse_windowdragging = true
        background_color = rgb(1E1E2E)
      }

      dwindle {
        force_split = 2
        preserve_split = true
      }

      group {
        col.border_active = rgb(3C3836)
        col.border_inactive = rgb(504945)
        groupbar {
          render_titles = false
          gradients = true
          col.active = rgb(3C3836)
          col.inactive = rgb(504945)
        }
      }

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
        # screen_shader = ~/gg.glsl
      }

      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.0
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, myBezier, popin 80%
        animation = border, 1, 10, myBezier
        animation = fade, 1, 10, myBezier
        animation = workspaces, 1, 6, myBezier, slide
      }
    '';
  };
}
