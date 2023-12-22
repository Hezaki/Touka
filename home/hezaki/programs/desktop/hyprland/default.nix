{ inputs, pkgs, ... }: {
  imports = [ ./binds.nix ./autostart.nix ];
  home = {
    packages = with pkgs; [
      waypaper
      inputs.hypr-contrib.packages.${pkgs.system}.grimblast 
      wl-clipboard 
      wf-recorder
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    enableNvidiaPatches = false;
    systemd.enable = false;
    plugins = with inputs; with pkgs; [
      hycov.packages.${pkgs.system}.hycov
      hyprfocus.packages.${pkgs.system}.hyprfocus
    ];
    extraConfig = 
      ''
        monitor=,preferred,auto,1

        exec = sh $HOME/.config/hypr/autostart.sh
        source = ./binds.conf

        # rules
        windowrule = float, title:^(Library)$
        windowrule = move center 1, title:^(Library)$
        windowrule = workspace 2, firefox
        windowrule = workspace 3, org.telegram.desktop
        windowrule = workspace 4, WebCord
        windowrule = workspace 5, virt-manager
        windowrule = workspace 5, org.prismlauncher.PrismLauncher
        windowrule = workspace 6, org.pwmt.zathura 
        windowrule = workspace 7, obsidian
        windowrule = workspace 8, org.kde.kdeconnect.app

        input {
          kb_layout = us,ru
          kb_options = grp:caps_toggle
          follow_mouse = 1
          sensitivity = -0.5
          repeat_rate = 50
          repeat_delay = 500
          touchpad {
            natural_scroll = false
            disable_while_typing = true
          }
        }

        general {
          gaps_in = 5
          gaps_out = 10
          border_size = 3
          col.active_border = rgb(1e1e2e)
          col.inactive_border = rgb(1e1e2e)
          layout = dwindle
          cursor_inactive_timeout = 3
          apply_sens_to_raw = 0
        }

        misc { 
          vfr = true
          enable_swallow = true
          swallow_regex = foot
          disable_splash_rendering = true
          disable_hyprland_logo = true
          animate_manual_resizes = true
          animate_mouse_windowdragging = true
          background_color = rgb{1E1E2E}
        }

        dwindle {
          force_split = 2
        }

        master {
          new_is_master = true
          allow_small_split = true
          mfact = 0.5
        }

        group {
          col.border_active = rgb(1E1E2E)
          col.border_inactive = rgb(2A2B3C)
          groupbar {
            render_titles = false
            gradients = true
            col.active = rgb(89b4fa)
            col.inactive = rgb(45475a)
          }
        }

        gestures {
          workspace_swipe = off
        }

        binds {
          workspace_back_and_forth = true
          allow_workspace_cycles = true
        }

        decoration {
          rounding = 2
          drop_shadow = true
          shadow_range = 6
          shadow_render_power = 1
          col.shadow = rgb(15161A)
          blur {
            enabled = false
            new_optimizations = true
          }
        }

        animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.1
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = fade, 1, 10, default
          animation = workspaces, 1, 6, default, slide
        }

        plugin {
          hycov {
            overview_gappo = 35
            overview_gappi = 9
            hotarea_size = 5
            enable_hotarea = 0 
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
        }
    '';
  };
}
