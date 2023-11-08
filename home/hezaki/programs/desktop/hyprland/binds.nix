{
  xdg.configFile."hypr/binds.conf".text = ''
    $mod = SUPER

    bind = $mod, RETURN, exec, foot -e tmux

    bind = $mod, W, killactive, 
    bind = $mod, M, exit, 
    bind = $mod, S, togglefloating, 
    bind = $mod, F, fullscreen,
    bind = $mod, C, centerwindow,

    binde =, F12, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
    binde =, F11, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
    bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    bind = $mod SHIFT, R, exec, pkill swaybg && pkill waybar && hyprctl reload
    bind = $mod, D, exec, rofi -drun-use-desktop-cache -show drun
    bind = ALT, P, exec, hyprpicker -a

    bind = ,Print, exec, wayshot -f $HOME/Screenshots/$(date +'%s.png') | wl-copy
    bind = $mod, Print, exec, wayshot -s "$(slurp -d)" -f $HOME/Screenshots/$(date +'%s.png') | wl-copy
    bind = $mod, F9, exec, wf-recorder

    bind = $mod, G, togglegroup
    binde = $mod, Tab, changegroupactive, f
    binde = $modSHIFT, Tab, changegroupactive, b

    bind = $mod, ESCAPE, hycov:toggleoverview
    
    bind = $mod, H, movefocus, l
    bind = $mod, J, movefocus, d
    bind = $mod, L, movefocus, r
    bind = $mod, K, movefocus, u

    bind = $mod CTRL, H, swapwindow, l
    bind = $mod CTRL, L, swapwindow, r
    bind = $mod CTRL, K, swapwindow, u
    bind = $mod CTRL, J, swapwindow, d

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
}
