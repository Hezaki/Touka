{
  xdg.configFile."hypr/binds.conf".text = ''
    $mod = SUPER

    bind = $mod, RETURN, exec, foot -e tmux new-session -t main

    bind = ctrlALT, ESCAPE, exec, systemctl suspend

    bind = $mod, W, killactive, 
    bind = $mod, M, exit, 
    bind = $mod, S, togglefloating, 
    bind = $mod, F, fullscreen,
    bind = $mod, A, pseudo,

    binde =, F12, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+
    binde =, F11, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-
    bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

    bind = ALT, C, exec, dunstctl close-all
    bind = ALT, A, exec, dunstctl history-pop

    bind = $mod SHIFT, R, exec, pkill swaybg && pkill waybar && hyprctl reload
    bind = $mod, D, exec, anyrun
    bind = ALT, P, exec, hyprpicker -a
    bind = ALT, G, exec, gtklock -i -s ~/.config/gtklock/style.css

    bind = ,Print, exec, grimblast copysave screen $HOME/Media/Screenshots/$(date +'%d%m%y%H-%s.png')
    bind = $mod, Print, exec, grimblast --freeze copysave area $HOME/Media/Screenshots/$(date +%d%m%y%H-%s.png)

    bind = $mod, F9, exec, wf-recorder -f $HOME/Media/Videos/$(date +%d%m%y%H.mkv)
    bind = $mod SHIFT, F9, exec, wf-recorder -g "$(slurp)" -f $HOME/Media/Videos/$(date +%d%m%y%H.mkv)
    bind =, F8, exec, pkill wf-recorder

    bind = $mod, G, togglegroup
    binde = $mod, Tab, changegroupactive, f
    binde = $modSHIFT, Tab, changegroupactive, b

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
    bind = $mod, Z, workspace, 5
    bind = $mod, X, workspace, 6
    bind = $mod, C, workspace, 7
    bind = $mod, V, workspace, 8

    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, Z, movetoworkspace, 5
    bind = $mod SHIFT, X, movetoworkspace, 6
    bind = $mod SHIFT, C, movetoworkspace, 7
    bind = $mod SHIFT, V, movetoworkspace, 8
    bind = $mod SHIFT, F, movetoworkspace, 9

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
  '';
}
