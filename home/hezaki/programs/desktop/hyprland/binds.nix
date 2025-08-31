{ pkgs, ... }:
{
  xdg.configFile."hypr/binds.conf".text = # hyprlang
    ''
      $mod = SUPER

      bindl =, switch:on:Lid Switch, exec, hyprlock 
      bind =, XF86Favorites, exec, hyprlock

      bind = $mod, RETURN, exec, kitty -e tmux new-session -t main
      bind = $mod SHIFT, RETURN, exec, obsidian

      bind = $mod, W, killactive, 
      bin = $mod, M, exit, 
      bind = $mod, S, togglefloating, 
      bind = ALT, F, fullscreen,

      bind = $mod SHIFT, TAB, togglegroup, 
      bind = $mod, TAB, changegroupactive,

      binde =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+
      binde =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-
      binde = $mod, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%+
      binde = $mod, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 10%-
      bind =, XF86AudioMute, exec,fixf4=$(cat /sys/class/leds/platform\:\:mute/brightness); echo $((1-fixf4)) | sudo ${pkgs.coreutils}/bin/tee /sys/class/leds/platform\:\:mute/brightness; wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind =, XF86AudioMicMute, exec, fixf4=$(cat /sys/class/leds/platform\:\:micmute/brightness); echo $((1-fixf4)) | sudo ${pkgs.coreutils}/bin/tee /sys/class/leds/platform\:\:micmute/brightness; wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bind = , XF86Display, exec, bluetoothctl connect CC:FF:90:42:64:45

      bind =, XF86MonBrightnessDown, exec, sudo ${pkgs.light}/bin/light -U 10
      bind =, XF86MonBrightnessUp, exec, sudo ${pkgs.light}/bin/light -A 10

      bind = $mod SHIFT, R, exec, hyprctl reload
      bind = $mod, D, exec, anyrun
      bind = $mod, SHIFT, D, exec, cliphist list | anyrun --show-results-immediately true | cliphist decode | wl-copy
      bind = $mod, P, exec, hyprpicker -a

      bind =, Print, exec, sh $XDG_CONFIG_HOME/hypr/scripts/defSreenshot.sh

      bind =, Home, exec, wf-recorder -c h264_vaapi -d /dev/dri/renderD128 -o DP-2 --audio=alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor -f $HOME/Media/Videos/$(date +%Y%m%d_%Hh%Mm%Ss.mp4)
      bind = $mod, Home, exec, wf-recorder -c h264_vaapi -d /dev/dri/renderD128 -o eDP-1 --audio=alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor -f $HOME/Media/Videos/$(date +%Y%m%d_%Hh%Mm%Ss.mp4)
      bind =, End, exec, pkill wf-recorder

      bind =, Insert, exec, swaync-client -t -sw
      bind = $mod, Insert, exec, swaync-client --toggle-dnd

      bind = $mod, space, exec, pypr layout_center toggle

      bind = $mod, H, movefocus, l
      bind = $mod, J, movefocus, d
      bind = $mod, L, movefocus, r
      bind = $mod, K, movefocus, u

      bind = $mod SHIFT, H, swapwindow, l
      bind = $mod SHIFT, L, swapwindow, r
      bind = $mod SHIFT, K, swapwindow, u
      bind = $mod SHIFT, J, swapwindow, d

      binde = $mod CTRL, H, resizeactive, -72 0
      binde = $mod CTRL, J, resizeactive, 0 -72
      binde = $mod CTRL, K, resizeactive, 0 72
      binde = $mod CTRL, L, resizeactive, 72 0

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
