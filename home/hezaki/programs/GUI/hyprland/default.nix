{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor=,preferred,auto,1

      exec-once = swaybg -i /home/hezaki/.walppapi/grgib_2.png
      exec-once = waybar
      exec-once = brillo -S 60
      exec-once = hyprctl setcursor gruvboxc 1

      input {
        kb_layout = us,ru
        kb_options = grp:win_space_toggle
        follow_mouse = 1
        sensitivity = -0.4
        repeat_rate = 50
        repeat_delay = 500
      }

      general {
        gaps_in = 5
        gaps_out = 23
        border_size = 4
        col.active_border = rgb(1d2021)
        col.inactive_border = rgb(1d2021)
        layout = master
        cursor_inactive_timeout = 3
        apply_sens_to_raw = 0
      }

      misc { 
        vfr = true
        disable_splash_rendering = true
        disable_hyprland_logo = true
        animate_manual_resizes = true
        animate_mouse_windowdragging = true
      }

      decoration {
        rounding = 2
        multisample_edges = true
        blur = false
        blur_size = 0
        blur_passes = 0
        blur_new_optimizations = true
        drop_shadow = true
        shadow_range = 12
        shadow_render_power = 2
        col.shadow = rgb(101010)
      }

      animations {
        enabled = true
        bezier = myBezier, 0.13,0.99,0.29,1.1
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, slide
        animation = border, 1, 10, default
        animation = fade, 1, 10, default
        animation = workspaces, 1, 6, default, slide
      }

      master {
        new_is_master = true
        allow_small_split = true
        mfact = 0.5
      }

      gestures {
        workspace_swipe = off
      }

      windowrule = workspace 2, firefox
      windowrule = workspace 3, org.telegram.desktop
      windowrule = workspace 3, xyz.diamondb.gtkcord4
      windowrule = workspace 4, org.pwmt.zathura 
      windowrule = workspace 5, org.prismlauncher.PrismLauncher

      binds {
          workspace_back_and_forth = true
          allow_workspace_cycles = true
      }

      $mod = SUPER

      bind = $mod, RETURN, exec, foot -e tmux

      bind = $mod, W, killactive, 
      bind = $mod, M, exit, 
      bind = $mod, S, togglefloating, 
      bind = $mod, F, fullscreen,

      binde =, F11, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde =, F12, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 3%+

      bind = $mod, D, exec, rofi -show drun
      bind = ALT, S, exec, gtklock -d
      bind = $mod, B, exec, killall -SIGUSR1 waybar
      bind = ALT, P, exec, hyprpicker -a

      bind = ,Print, exec, grim -c $HOME/Screenshots/$(date +'%s.png')
      bind = $mod, Print, exec, grim -g "$(slurp)" $HOME/Screenshots/$(date +'%s.png')
      bind = $mod, F9, exec, wf-recorder

      bind = $mod, H, movefocus, l
      bind = $mod, J, movefocus, d
      bind = $mod, L, movefocus, r
      bind = $mod, K, movefocus, u

      bind = $mod CTRL, H, movewindow, l
      bind = $mod CTRL, L, movewindow, r
      bind = $mod CTRL, K, movewindow, u
      bind = $mod CTRL, J, movewindow, d

      binde = $mod SHIFT, H, resizeactive, -20 0
      binde = $mod SHIFT, J, resizeactive, 0 -20
      binde = $mod SHIFT, K, resizeactive, 0 20
      binde = $mod SHIFT, L, resizeactive, 20 0

      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      bind = $mod SHIFT, 1, movetoworkspace, 1
      bind = $mod SHIFT, 2, movetoworkspace, 2
      bind = $mod SHIFT, 3, movetoworkspace, 3
      bind = $mod SHIFT, 4, movetoworkspace, 4
      bind = $mod SHIFT, 5, movetoworkspace, 5
      bind = $mod SHIFT, 6, movetoworkspace, 6
      bind = $mod SHIFT, 7, movetoworkspace, 7
      bind = $mod SHIFT, 8, movetoworkspace, 8
      bind = $mod SHIFT, 9, movetoworkspace, 9
      bind = $mod SHIFT, 0, movetoworkspace, 10

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
	'';
  };
}