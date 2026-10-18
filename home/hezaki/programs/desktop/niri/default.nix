{
  inputs,
  pkgs,
  config,
  ...
}:
{
  imports = with inputs; [
    niri.homeModules.niri
    niri.homeModules.stylix
  ];

  home.packages =
    with pkgs;
    with inputs;
    [
      wl-clipboard
      wl-freeze
      hyprpicker
      gpu-screen-recorder
      gpu-screen-recorder-gtk
    ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    config =
      with config.lib.stylix.colors; # kdl
      ''
        spawn-at-startup "xwayland-satellite"
        spawn-at-startup "steam"
        spawn-at-startup "wl-paste" "--watch" "cliphist" "store";
        spawn-at-startup "udiskie"
        spawn-at-startup "zen-twilight"
        spawn-at-startup "AyuGram"
        spawn-sh-at-startup r#"
            tmux new-session -d -s main $SHELL
            tmux new-window nvim
            tmux new-window btop
            tmux new-window wiremix
            tmux select-window -t 1
        "#

        environment {
          DISPLAY ":0"
          QT_QPA_PLATFORMTHEME_QT6 "termfilechooser"
          QT_QPA_PLATFORMTHEME "termfilechooser"
        }

        input {
          workspace-auto-back-and-forth
          warp-mouse-to-focus
          focus-follows-mouse max-scroll-amount="0%"
          keyboard {
            repeat-delay 500
            repeat-rate 50
            xkb {
              layout "us,ru"
              options "grp:caps_toggle,compose:ralt"
            }
          }

          touchpad {
            tap
            scroll-factor 0.4
            accel-speed 0.5
          }

          mouse {
            accel-speed -0.87
            accel-profile "flat"
            scroll-method "no-scroll"
          }

          trackpoint {
            accel-speed 0.6
            accel-profile "adaptive"
          }
        }

        gestures {
          dnd-edge-view-scroll {
            trigger-width 10
            delay-ms 50
            max-speed 1500
          }

          dnd-edge-workspace-switch {
            trigger-height 50
            delay-ms 50
            max-speed 1500
          }
        }

        screenshot-path "~/Pictures/Screenshot %Y-%m-%d %H-%M-%S.png"
        prefer-no-csd

        layer-rule {
          match at-startup=true
          match namespace="^noctalia-backdrop"

          place-within-backdrop true
        }

        layer-rule {
          match namespace="^noctalia-(notification-[^\"]+||dock|panel|attached-panel|osd)$"
          background-effect {
            xray false
            blur true
          }
        }

        output "DP-2" {
          mode "3440x1440@120"
          scale 1.0

          layout { 
            background-color "#12140e"
            center-focused-column "always"
            always-center-single-column true
            default-column-width { proportion 0.66667; }

            preset-column-widths {
              proportion 0.33333
              proportion 0.5
              proportion 0.66667
              proportion 0.8
            }
          }
        }

        output "eDP-1" {
          mode "1920x1080@60"
          scale 1.0

          layout {
            default-column-width { proportion 0.8; }
            center-focused-column "always"
          }
        }

        cursor {
          hide-after-inactive-ms 1000
        }

        overview {
          zoom 0.7
          backdrop-color "#${base00}"

          workspace-shadow {
            on
          }
        }

        recent-windows {
          debounce-ms 750
          open-delay-ms 150

          highlight {
            active-color "#${base00}"
            urgent-color "#${base08}"
            padding 30
            corner-radius 20
          }

          previews {
            max-height 480
            max-scale 0.5
          }

          binds {
            Mod+Tab         { next-window; }
            Mod+Shift+Tab   { previous-window; }
            Mod+grave       { next-window     filter="app-id"; }
            Mod+Shift+grave { previous-window filter="app-id"; }
          }
        }

        hotkey-overlay {
          skip-at-startup
        }

        layout {
          gaps 12
          center-focused-column "always"
          background-color "#${base00}"
          default-column-display "normal"
          default-column-width { proportion 1.0; }

          preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            proportion 0.8
          }

          preset-window-heights {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            fixed 720
          }

          focus-ring { 
            off
          }

          shadow {
            on
            softness 20
            spread 2
            offset x=0 y=4
            color "#000000"
          }

          border {
            width 1
            active-color "#${base00}"
            inactive-color "#${base03}"
            urgent-color "#${base08}"
          }

          struts {
            bottom 3
            top 3
          }
        }

        blur {
          on
          passes 2
          offset 6.0
          noise 0.09
          saturation 1.5
        }

        animations {
          slowdown 1.0
          window-open {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
            custom-shader r"
              vec4 open_color(vec3 coords_geo, vec3 size_geo) {
                float p = niri_clamped_progress;
                float y_offset = mix(0.15, 0.0, p);
                float scale = mix(0.85, 1.0, p);
                vec2 uv = coords_geo.xy;
                vec2 centered = uv - 0.5;
                centered.y -= y_offset;
                centered /= scale;
                vec2 tex_uv = centered + 0.5;
                vec3 coords_tex = niri_geo_to_tex * vec3(tex_uv, coords_geo.z);
                vec4 oColor = texture2D(niri_tex, coords_tex.st);
                float corner_radius = 12.0;
                vec2 pixel_pos = centered * size_geo.xy;
                vec2 box_size = size_geo.xy * 0.5;
                float radius = min(corner_radius, min(box_size.x, box_size.y));
                vec2 q = abs(pixel_pos) - box_size + vec2(radius);
                float dist = length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - radius;
                float mask = 1.0 - smoothstep(-0.5, 0.5, dist);
                float alpha = clamp(p * 2.0, 0.0, 1.0);
                return oColor * mask * alpha;
              }
            "
          }

          window-close {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
            custom-shader r"
              vec4 close_color(vec3 coords_geo, vec3 size_geo) {
                  float p = 1.0 - niri_clamped_progress;
                  float y_offset = mix(0.15, 0.0, p);
                  float scale = mix(0.85, 1.0, p);
                  vec2 uv = coords_geo.xy;
                  vec2 centered = uv - 0.5;
                  centered.y -= y_offset;
                  centered /= scale;
                  vec2 tex_uv = centered + 0.5;
                  vec3 coords_tex = niri_geo_to_tex * vec3(tex_uv, coords_geo.z);
                  vec4 oColor = texture2D(niri_tex, coords_tex.st);
                  float corner_radius = 12.0;
                  vec2 pixel_pos = centered * size_geo.xy;
                  vec2 box_size = size_geo.xy * 0.5;
                  float radius = min(corner_radius, min(box_size.x, box_size.y));
                  vec2 q = abs(pixel_pos) - box_size + vec2(radius);
                  float dist = length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - radius;
                  float mask = 1.0 - smoothstep(-0.5, 0.5, dist);
                  float alpha = clamp(p * 2.0, 0.0, 1.0);
                  return oColor * mask * alpha;
              }
            "
          }

          window-resize {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          workspace-switch {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          horizontal-view-movement {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          window-movement {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          config-notification-open-close {
            duration-ms 350
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          exit-confirmation-open-close {
            duration-ms 300
            curve "ease-out-quad"
          }

          screenshot-ui-open {
            duration-ms 300
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          overview-open-close {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }

          recent-windows-close {
            duration-ms 400
            curve "cubic-bezier" 0.05 0.9 0.1 1.0
          }
        }

        workspace "1" {
          open-on-output "DP-2"
        }

        workspace "2" {
          open-on-output "DP-2"
        }

        workspace "3" {
          open-on-output "DP-2"
        }

        window-rule {
          open-focused true
          geometry-corner-radius 23
          clip-to-geometry true
          draw-border-with-background false
          tiled-state true

          background-effect {
            xray true
            blur true
          }
        }

        window-rule {
          match app-id="Nautilus"
          match app-id="zen-twilight"

          popups {
            geometry-corner-radius 23
          }
        }

        window-rule {
          match app-id="mpv"
          variable-refresh-rate true
          open-maximized true
        }

        window-rule { 
          match app-id="obsidian"
        }

        window-rule { 
          match app-id="zen-twilight"
          open-on-workspace "1"
          default-column-width { proportion 0.9; }
          open-focused false
        }

        window-rule { 
          match app-id="com.github.th_ch.youtube_music"
          open-on-workspace "1"
        }

        window-rule {
          match app-id="zen-twilight$" title="^Picture-in-Picture$"
          open-floating true
          default-column-width { fixed 600; }
          default-window-height { fixed 338; }
          default-floating-position x=16 y=50 relative-to="bottom-left"
        }

        window-rule {
          match app-id=".scrcpy-wrapped" title="^LE2100$"
          default-column-width { fixed 530; }
          default-window-height { fixed 1176; }
        }

        window-rule { 
          match app-id="equibop"
          default-column-width { proportion 0.66667; }
          open-focused false
          open-on-workspace "2"
        }

        window-rule { 
          match app-id="com.ayugram.desktop"
          default-column-width { fixed 790; }
          open-focused false
          open-on-workspace "2"
        }


        window-rule {
          match app-id="com.ayugram.desktop" title="Media viewer"
          open-focused true
        }

        window-rule { 
          match app-id="Badlion Client"
          match app-id="org.prismlauncher.PrismLauncher"
          match app-id="libreoffice-writer"
          match app-id="net.lutris.Lutris"
          open-on-workspace "3"
        }

        window-rule {
          match app-id="steam"
          open-focused false
          open-on-workspace "3"
        }

        window-rule {
          match app-id="steam" title="^Friends List$"
          default-column-width { proportion 0.33333; }
        }

        window-rule {
          match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
          default-floating-position x=10 y=10 relative-to="bottom-right"
          open-focused false
        }

        window-rule { 
          match app-id="music"
          open-focused false
          open-on-workspace "1"
        }

        window-rule { 
          match app-id="com.github.wwmm.easyeffects"
          match app-id="io.github.seadve.Mousai"
        }

        binds {
          Mod+Shift+Slash { show-hotkey-overlay; }
          Mod+Space { toggle-overview; }

          Mod+O { spawn-sh "niri msg action toggle-windowed-fullscreen && niri msg action maximize-window-to-edges && noctalia msg bar-toggle"; }

          Mod+Return { spawn-sh "foot -e tmux attach -t main"; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03+"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03-"; }
          Mod+XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10+"; }
          MOd+XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10-"; }
          XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

          Mod+Minus { spawn-sh "noctalia msg brightness-down"; }
          Mod+Equal { spawn-sh "noctalia msg brightness-up"; }

          Mod+P { spawn-sh "hyprpicker -an"; }

          Mod+W { close-window; }
          Mod+S { toggle-window-floating; }
          Mod+A { center-window; }

          Mod+Left  { focus-column-left; }
          Mod+Down  { focus-window-down; }
          Mod+Up    { focus-window-up; }
          Mod+Right { focus-column-right; }
          Mod+H     { focus-column-left; }
          Mod+J     { focus-window-down; }
          Mod+K     { focus-window-up; }
          Mod+L     { focus-column-right; }

          Mod+Ctrl+H     { consume-or-expel-window-left; }
          Mod+Ctrl+J     { focus-monitor-down; }
          Mod+Ctrl+K     { focus-monitor-up; }
          Mod+Ctrl+L     { consume-or-expel-window-right; }

          Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
          Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
          Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
          Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

          Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
          Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
          Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
          Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

          Mod+Shift+H { move-column-left; }
          Mod+Shift+J { move-window-down; }
          Mod+Shift+K { move-window-up; }
          Mod+Shift+L { move-column-right; }

          Mod+1 { focus-workspace 1; }
          Mod+2 { focus-workspace 2; }
          Mod+3 { focus-workspace 3; }

          Mod+Shift+1 { move-column-to-workspace 1; }
          Mod+Shift+2 { move-column-to-workspace 2; }
          Mod+Shift+3 { move-column-to-workspace 3; }
          Mod+Shift+4 { move-column-to-workspace 4; }
          Mod+Shift+z { move-column-to-workspace 5; }
          Mod+Shift+x { move-column-to-workspace 6; }
          Mod+Shift+c { move-column-to-workspace 7; }
          Mod+Shift+v { move-column-to-workspace 8; }
          Mod+Shift+f { move-column-to-workspace 9; }
          Mod+Shift+g { move-column-to-workspace 10; }

          Mod+R { switch-preset-column-width; }
          Mod+Shift+R { switch-preset-window-height; }
          Mod+Ctrl+R { reset-window-height; }
          Mod+M { maximize-column; }
          Mod+F { fullscreen-window; }

          Print { screenshot-screen; }
          Mod+Print { screenshot; }
          Ctrl+Print { screenshot-window; }
          Mod+Ctrl+Print { spawn-sh "noctalia msg screenshot-annotate"; }

          Mod+Shift+S { spawn-sh "scrcpy --max-fps=120 --print-fps -KMSw"; }

          Mod+Ctrl+P {
            spawn-sh "wl-freeze -c 'niri msg --json focused-window | jq \".pid\"'"
          }

          F12 { spawn-sh "noctalia msg session lock"; }
          Mod+Shift+Backslash { spawn-sh "noctalia msg panel-toggle session"; }
          Mod+Shift+Backspace { spawn-sh "noctalia msg notification-dnd-toggle"; }
          Mod+Backspace { spawn-sh "noctalia msg panel-toggle control-center notifications"; }
          Mod+D { spawn-sh "noctalia msg panel-toggle launcher"; }
          Mod+Shift+D { spawn-sh "noctalia msg panel-toggle clipboard"; }
        }
      '';
  };
}
