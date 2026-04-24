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
    noctalia.homeModules.default
    system76-scheduler-niri.homeModules.default
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  home.packages = with pkgs; with inputs; [
    wl-clipboard
    # wl-freeze
    hyprpicker
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    niri-float-sticky.packages.${stdenv.hostPlatform.system}.default
  ];

  services = {
    system76-scheduler-niri.enable = true;
    swayidle.enable = true;
    playerctld.enable = true;
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    config =
      with config.lib.stylix.colors; # kdl
      ''
        spawn-at-startup "noctalia-shell" "--no-duplicate"
        spawn-at-startup "xwayland-satellite"
        spawn-at-startup "batsignal"
        spawn-at-startup "steam"
        spawn-at-startup "wl-paste" "--watch" "cliphist" "store";
        spawn-at-startup "udiskie"
        spawn-at-startup "tmux" "new-session" "-d"
        spawn-at-startup "firefox"
        spawn-at-startup "AyuGram"
        spawn-at-startup "tg-ws-proxy" "--port" "1917"
        spawn-at-startup "niri-float-sticky" "-app-id" "firefox" "-title" "Picture-in-Picture"

        environment {
          DISPLAY ":0"
          QT_QPA_PLATFORMTHEME "gtk3"
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

        screenshot-path "~/Media/Screenshots/Screenshot %Y-%m-%d %H-%M-%S.png"
        prefer-no-csd

        layer-rule {
          match at-startup=true
          match namespace="waybar"
          match namespace="^swww-daemonoverview$"
          match namespace="^noctalia-overview*"
          // match namespace="^wallpaper$"

          place-within-backdrop true
        }

        layer-rule {
          match namespace="rofi"
          match namespace="waybar"
          match namespace="noctalia-shell"

          shadow {
            on
            softness 30
            spread 4
            draw-behind-window true
          }

          place-within-backdrop true
        }

        output "DP-2" {
          mode "3440x1440@120"
          scale 1.0
          focus-at-startup
          variable-refresh-rate on-demand=true
          // position x=6045 y=2205
        }

        output "eDP-1" {
          mode "1920x1080@60"
          scale 1.0
          // position x=6796 y=3645
        }

        cursor {
          hide-after-inactive-ms 1000
        }

        overview {
          zoom 0.7
          backdrop-color "#${base00}"
          // workspace-shadow {
          //   off
          // }
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
          gaps 13
          center-focused-column "always"
          background-color "#${base00}"
          always-center-single-column
          default-column-display "normal"
          preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            proportion 0.8
          }

          focus-ring { 
            off
          }

          shadow {
            on
            softness 30
            spread 4
            draw-behind-window true
          }

          default-column-width { proportion 0.8; }

          border {
            width 1
            active-color "#${base02}"
            inactive-color "#${base07}"
            urgent-color "#${base08}"
          }

          struts {
            bottom 1
            top 1
          }
        }

        switch-events {
          lid-close { spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock"; }
        }

        animations {
          workspace-switch {
            spring damping-ratio=1.3 stiffness=1000 epsilon=0.0001
          }

          window-open {
            duration-ms 150
            curve "ease-out-expo"
          }

          window-close {
            duration-ms 150
            curve "ease-out-quad"
          }

          horizontal-view-movement {
            spring damping-ratio=1.3 stiffness=1000 epsilon=0.0001
          }

          window-movement {
            spring damping-ratio=1.3 stiffness=800 epsilon=0.0001
          }

          window-resize {
            spring damping-ratio=1.3 stiffness=800 epsilon=0.0001
          }

          config-notification-open-close {
            spring damping-ratio=0.8 stiffness=1000 epsilon=0.001
          }

          exit-confirmation-open-close {
            spring damping-ratio=0.8 stiffness=500 epsilon=0.01
          }

          screenshot-ui-open {
            duration-ms 200
            curve "ease-out-quad"
          }

          overview-open-close {
            spring damping-ratio=1.3 stiffness=800 epsilon=0.0001
          }

          recent-windows-close {
            spring damping-ratio=1.3 stiffness=800 epsilon=0.001
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

        workspace "6" {
          open-on-output "DP-2"
        }

        workspace "7" {
          open-on-output "DP-2"
        }

        workspace "8" {
          open-on-output "DP-2"
        }

        workspace "9" {
          open-on-output "DP-2"
        }

        window-rule {
          open-focused true
          geometry-corner-radius 6
          clip-to-geometry true
          draw-border-with-background true
          tiled-state true
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
          default-column-width { proportion 0.8; }
          open-focused false
        }

        window-rule { 
          match app-id="com.github.th_ch.youtube_music"
          open-on-workspace "2"
          default-column-width { proportion 0.33333; }
          open-focused false
        }

        window-rule {
          match app-id="firefox$" title="^Picture-in-Picture$"
          open-floating true
          default-column-width { fixed 600; }
          default-window-height { fixed 350; }
          default-floating-position x=16 y=48 relative-to="bottom-left"
        }

        window-rule {
          match app-id="firefox$" title="^Save Image$"
        }

        window-rule { 
          match app-id="com.ayugram.desktop"
          match app-id="equibop"
          default-column-width { proportion 0.8; }
          open-focused false
          open-on-workspace "3"
        }

        window-rule {
          match app-id="Waydroid" title="Waydroid"
          default-column-width { fixed 630; }
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
          open-focused false
          default-column-width { proportion 0.8; }
          open-on-workspace "5"
        }

        window-rule {
          match app-id="steam"
          default-column-width { proportion 0.8; }
          open-on-workspace "5"
        }

        window-rule { 
          match app-id="music"
          open-focused false
          default-column-width { fixed 630; }
          open-on-workspace "2"
        }

        window-rule { 
          match app-id="com.github.wwmm.easyeffects"
          match app-id="io.github.seadve.Mousai"
          default-column-width { proportion 0.8; }
        }

        window-rule {
          match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
          default-floating-position x=10 y=10 relative-to="bottom-right"
        }

        binds {
          Mod+Shift+Slash { show-hotkey-overlay; }
          Mod+Space { toggle-overview; }

          Mod+O { toggle-windowed-fullscreen; }

          Mod+Return { spawn "kitty" "-e" "tmux" "attach-session"; }
          Mod+D { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
          Mod+Shift+D { spawn "noctalia-shell" "ipc" "call" "plugin:clipboard" "toggle"; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03+"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03-"; }
          Mod+XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10+"; }
          MOd+XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10-"; }
          XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
          XF86Display { spawn "bluetoothctl" "connect" "CC:FF:90:42:64:45"; }

          XF86MonBrightnessDown { spawn "sudo" "${pkgs.light}/bin/light" "-U" "10"; }
          XF86MonBrightnessUp { spawn "sudo" "${pkgs.light}/bin/light" "-A" "10"; }

          Mod+P { spawn "hyprpicker" "-a"; }
          Mod+Shift+E { spawn "smile"; }

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

          F12 { spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock"; }
          Mod+F12 { spawn "noctalia-shell" "ipc" "call" "sessionMenu" "toggle"; }
          Mod+Backspace { spawn "noctalia-shell" "ipc" "call" "notifications" "toggleHistory"; }
          Mod+Shift+Backspace { spawn "noctalia-shell" "ipc" "call" "notifications" "toggleDND"; }
        }
      '';
  };
}
