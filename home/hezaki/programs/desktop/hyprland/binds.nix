{
  xdg.configFile."hypr/binds.conf".text = ''
    $mod = SUPER

    bindl =, switch:on:Lid Switch, exec, hyprctl keyword input:kb_variant = us && hyprlock 
    bind =, XF86Favorites, exec, hyprctl keyword input:kb_variant = us && hyprlock

    bind = $mod, RETURN, exec, foot -e tmux new-session -t main
    bind = $mod SHIFT, RETURN, exec, foot --font="JetBrainsMonoNF:size=17" -e tmux new-session -t main

    bind = $mod, W, killactive, 
    bind = $mod, M, exit, 
    bind = $mod, S, togglefloating, 
    bind = ALT, F, fullscreen,

    binde =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+
    binde =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-
    binde = $mod, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%+
    binde = $mod, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%-
    bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bind =, XF86AudioMicMute, exec, fixf4=$(cat /sys/class/leds/platform\:\:micmute/brightness); echo $((1-fixf4)) | doas tee /sys/class/leds/platform\:\:micmute/brightness; wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

    bind =, XF86MonBrightnessDown, exec, doas light -U 10
    bind =, XF86MonBrightnessUp, exec, doas light -A 10

    bind = $mod SHIFT, R, exec, pkill swaybg && pkill waybar && pkill batsignal && hyprctl reload
    bind = $mod, D, exec, anyrun
    bind = $mod SHIFT, D, exec, cliphist list | anyrun --show-results-immediately true | wl-copy
    bind = $mod, P, exec, hyprpicker -a

    bind = , Print, exec, grimblast --notify copysave screen $HOME/Media/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss.png)
    bind = $mod, Print, exec, grimblast --notify --freeze copysave area $HOME/Media/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss.png)

    bind =, Home, exec, obs --startrecording 
    bind =, End, exec, pkill obs
    bind =, Insert, exec, swaync-client -t -sw

    bind = $mod, H, movefocus, l
    bind = $mod, J, movefocus, d
    bind = $mod, L, movefocus, r
    bind = $mod, K, movefocus, u

    bind = $mod CTRL, H, swapwindow, l
    bind = $mod CTRL, L, swapwindow, r
    bind = $mod CTRL, K, swapwindow, u
    bind = $mod CTRL, J, swapwindow, d

    binde = $mod SHIFT, H, resizeactive, -72 0
    binde = $mod SHIFT, J, resizeactive, 0 -72
    binde = $mod SHIFT, K, resizeactive, 0 72
    binde = $mod SHIFT, L, resizeactive, 72 0

    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, Z, workspace, 5
    bind = $mod, X, workspace, 6
    bind = $mod, C, workspace, 7
    bind = $mod, V, workspace, 8
    bind = $mod, F, workspace, 9
    bind = $mod, G, workspace, 10

    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, Z, movetoworkspace, 5
    bind = $mod SHIFT, X, movetoworkspace, 6
    bind = $mod SHIFT, C, movetoworkspace, 7
    bind = $mod SHIFT, V, movetoworkspace, 8
    bind = $mod SHIFT, F, movetoworkspace, 9
    bind = $mod SHIFT, G, movetoworkspace, 10

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
  '';
}
