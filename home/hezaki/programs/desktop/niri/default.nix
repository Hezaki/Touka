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
      niri-float-sticky.packages.${stdenv.hostPlatform.system}.default
    ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;

    config =
      with config.lib.stylix.colors; # kdl
      ''
        spawn-at-startup "xwayland-satellite"
        spawn-at-startup "batsignal"
        spawn-at-startup "steam"
        spawn-at-startup "wl-paste" "--watch" "cliphist" "store";
        spawn-at-startup "udiskie"
        spawn-at-startup "firefox"
        spawn-at-startup "AyuGram"
        spawn-at-startup "tg-ws-proxy" "--port" "1917" "--secret" "3075abe65830f0325116bb0416cadf9f"
        spawn-at-startup "niri-float-sticky" "-app-id" "firefox" "-title" "Picture-in-Picture"
        spawn-sh-at-startup r#"
            tmux new-session -d -s main $SHELL
            tmux new-window nvim
            tmux new-window btop
            tmux new-window opencode
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
              options "grp:caps_toggle"
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
          match namespace="dms:blurwallpaper"

          place-within-backdrop true
        }

        layer-rule {
          match namespace="^dms:bar*"

          shadow {
            on
            softness 40
            spread 5
            offset x=0 y=5
            draw-behind-window true
            color "#00000064"
          }
        }

        output "DP-2" {
          mode "3440x1440@120"
          scale 1.0

          layout { 
            background-color "transparent"
            center-focused-column "never"
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
            center-focused-column "never"
            always-center-single-column true
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
            active-color "#${base03}"
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
          gaps 10
          center-focused-column "always"
          background-color "#${base00}"
          default-column-display "normal"
          default-column-width { proportion 0.8; }

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
            softness 40
            spread 5
            offset x=0 y=5
            draw-behind-window true
            color "#00000064"
          }

          border {
            width 1
            active-color "#${base02}"
            inactive-color "#${base03}"
            urgent-color "#${base08}"
          }

          struts {
            bottom 1
            top 1
          }
        }

        blur {
          on
          offset 12
          noise 0.02
          saturation 1.5
        }

        animations {
          slowdown 1.0

          window-open {
            duration-ms 180
            curve "cubic-bezier" 0.0 0.0 0.2 1.0
            custom-shader r"
              vec4 open_color(vec3 coords_geo, vec3 size_geo) {
                float progress = niri_clamped_progress;
                progress = pow(progress, 0.85);
                float scale = 0.96 + progress * 0.04;
                float alpha = progress;
                vec2 uv = (coords_geo.xy - 0.5) * scale + 0.5;
                if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
                  return vec4(0.0);
                }
                vec4 color = texture(niri_tex, (niri_geo_to_tex * vec4(uv, coords_geo.z, 1.0)).xy);
                return vec4(color.rgb, color.a * alpha);
              }
            "
          }

          window-close {
            duration-ms 100
            curve "cubic-bezier" 0.4 0.0 1.0 1.0
            custom-shader r"
              vec4 close_color(vec3 coords_geo, vec3 size_geo) {
                float progress = niri_clamped_progress;
                float scale = 1.0 - progress * 0.06;
                float alpha = 1.0 - progress * 0.85;
                vec2 uv = (coords_geo.xy - 0.5) * scale + 0.5;
                if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
                  return vec4(0.0);
                }
                vec4 color = texture(niri_tex, (niri_geo_to_tex * vec4(uv, coords_geo.z, 1.0)).xy);
                return vec4(color.rgb, color.a * alpha);
              }
            "
          }

          workspace-switch {
            spring damping-ratio=0.85 stiffness=400 epsilon=0.0001
          }

          horizontal-view-movement {
            spring damping-ratio=0.75 stiffness=380 epsilon=0.0001
          }

          window-movement {
            spring damping-ratio=0.85 stiffness=450 epsilon=0.0001
          }

          window-resize {
            spring damping-ratio=0.9 stiffness=480 epsilon=0.0001
          }

          overview-open-close {
            spring damping-ratio=0.85 stiffness=420 epsilon=0.0001
          }

          screenshot-ui-open {
            duration-ms 220
            curve "cubic-bezier" 0.0 0.0 0.2 1.0
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

        workspace "4" {
          open-on-output "DP-2"
        }

        workspace "5" {
          open-on-output "DP-2"
        }

        window-rule {
          open-focused true
          geometry-corner-radius 16
          clip-to-geometry true
          draw-border-with-background true
          tiled-state true
        }

        window-rule {
          match title="Counter-Strike 2"
          open-fullscreen true
          min-width 1720
          min-height 720
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
          match app-id="firefox"
          open-on-workspace "2"
          open-focused false
        }

        window-rule { 
          match app-id="com.github.th_ch.youtube_music"
          open-on-workspace "2"
        }

        window-rule {
          match app-id="firefox$" title="^Picture-in-Picture$"
          open-floating true
          default-column-width { fixed 600; }
          default-window-height { fixed 338; }
          default-floating-position x=16 y=50 relative-to="bottom-left"
        }

        window-rule {
          match app-id=".scrcpy-wrapped" title="^LE2100$"
          default-column-width { fixed 637; }
          default-window-height { fixed 1414; }
        }

        window-rule {
          match app-id="firefox$" title="^Save Image$"
        }

        window-rule { 
          match app-id="com.ayugram.desktop"
          match app-id="equibop"
          open-focused false
          open-on-workspace "3"
        }

        window-rule {
          match app-id="Waydroid" title="Waydroid"
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
          open-on-workspace "5"
        }

        window-rule {
          match app-id="steam"
          open-focused false
          open-on-workspace "5"
        }

        window-rule { 
          match app-id="music"
          open-focused false
          open-on-workspace "2"
        }

        window-rule { 
          match app-id="com.github.wwmm.easyeffects"
          match app-id="io.github.seadve.Mousai"
        }

        window-rule {
          match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
          default-floating-position x=10 y=10 relative-to="bottom-right"
          open-focused false
        }

        binds {
          Mod+Shift+Slash { show-hotkey-overlay; }
          Mod+Space { toggle-overview; }

          Mod+O { toggle-windowed-fullscreen; }

          Mod+Return { spawn-sh "ghostty -e tmux attach -t main"; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03+"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03-"; }
          Mod+XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10+"; }
          MOd+XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10-"; }
          XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
          XF86Display { spawn "bluetoothctl" "connect" "CC:FF:90:42:64:45"; }

          Mod+Minus { spawn "dms" "ipc" "call" "brightness" "decrement" "10" ""; }
          Mod+Equal { spawn "dms" "ipc" "call" "brightness" "increment" "10" ""; }

          Mod+P { spawn-sh "dms ipc call color-picker toggle"; }

          Mod+W { close-window; }
          Mod+S { toggle-window-floating; }

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
          Mod+4 { focus-workspace 4; }
          Mod+z { focus-workspace 5; }
          Mod+x { focus-workspace 6; }
          Mod+c { focus-workspace 7; }
          Mod+v { focus-workspace 8; }
          Mod+f { focus-workspace 9; }
          Mod+g { focus-workspace 10; }

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
          Mod+M { maximize-window-to-edges; }
          Mod+Ctrl+F { fullscreen-window; }

          Print { screenshot-screen; }
          Mod+Print { screenshot; }
          Ctrl+Print { screenshot-window; }

          Mod+Shift+S { spawn-sh "scrcpy --max-fps=120 --print-fps -KM"; }

          Mod+Ctrl+P {
            spawn-sh "wl-freeze -c 'niri msg --json focused-window | jq \".pid\"'"
          }

          F12 { spawn "dms" "ipc" "call" "lock" "lock"; }
          Mod+Shift+Backslash { spawn-sh "dms ipc call powermenu toggle"; }
          Mod+Shift+Backspace { spawn-sh "dms ipc call notifications toggleDoNotDisturb"; }
          Mod+Backspace { spawn "dms" "ipc" "call" "notifications" "toggle"; }
          Mod+D { spawn "dms" "ipc" "call" "spotlight" "toggle"; }
          Mod+Shift+D { spawn "dms" "ipc" "call" "clipboard" "toggle"; }
        }
      '';
  };
}
