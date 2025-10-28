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

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    hyprpicker
    wl-clipboard
    gpu-screen-recorder
    gpu-screen-recorder-gtk
    cliphist
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    config =
      with config.lib.stylix.colors; # kdl
      ''
        spawn-at-startup "swaybg" "-m" "fill" "-i" "/etc/nixos/home/hezaki/themes/images/wp.png";
        spawn-at-startup "flatpak" "run" "pw.mmk.OpenFreebuds" "--client";
        spawn-at-startup "xwayland-satellite"
        spawn-at-startup "swaync"
        spawn-at-startup "batsignal"
        spawn-at-startup "powermode-indicator"
        // spawn-at-startup "kdeconnect-indicator"
        spawn-at-startup "wl-paste" "--watch" "cliphist" "store";
        spawn-at-startup "udiskie"
        spawn-at-startup "tmux" "new-session" "-d"
        spawn-at-startup "firefox"
        spawn-at-startup "steam"
        spawn-at-startup "youtube-music"
        spawn-at-startup "ayugram-desktop"
        spawn-at-startup "obsidian"
        spawn-at-startup "waybar"

        environment {
          DISPLAY ":0"
        }

        input {
          workspace-auto-back-and-forth
          warp-mouse-to-focus
          // focus-follows-mouse
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
            accel-speed 0.7
          }

          mouse {
            accel-speed -0.5
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

        screenshot-path "~/Media/Screenshots/$(date +%Y%m%d_%Hh%Mm%Ss.png)"
        prefer-no-csd

        layer-rule {
          match at-startup=true
          match namespace="waybar"
          match namespace="anyrun"
          match namespace="swaync"
          // match namespace="^wallpaper$"

          geometry-corner-radius 13
          place-within-backdrop true
        }

        output "DP-2" {
          mode "3440x1440@120"
          scale 1.0
          focus-at-startup
          position x=6045 y=2205
        }

        output "eDP-1" {
          mode "1920x1080@60"
          scale 1.0
          position x=6796 y=3645
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

        hotkey-overlay {
          skip-at-startup
        }

        layout {
          gaps 16
          // center-focused-column "always"
          background-color "#${base00}"
          always-center-single-column
          default-column-display "normal"
          preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
          }

          focus-ring { 
            off
          }

          shadow {
            on
            softness 10
          }

          default-column-width { proportion 0.33333; }

          border {
            width 1
            active-color "#${base03}"
            inactive-color "#${base07}"
            urgent-color "#${base08}"
          }

          struts {
            bottom -1
            top 1
          }
        }

        switch-events {
          lid-close { spawn "hyprlock"; }
        }

        animations { }

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

        workspace "10" {
          open-on-output "DP-2"
        }

        window-rule {
          open-focused true
          geometry-corner-radius 13
          clip-to-geometry true
          draw-border-with-background true
          tiled-state true
        }

        window-rule {
          match app-id="mpv"
          open-maximized true
        }

        window-rule { 
          match app-id="kitty"
          default-column-width { proportion 0.66667; }
        }

        window-rule { 
          match app-id="firefox"
          open-on-workspace "2"
          open-maximized true
          open-focused false
        }

        window-rule {
          match app-id="firefox$" title="^Picture-in-Picture$"
          open-maximized true
        }

        window-rule {
          match app-id="firefox$" title="^Save Image$"
          open-maximized true
        }

        window-rule { 
          match app-id="com.ayugram.desktop"
          match app-id="vesktop"
          default-column-width { proportion 0.66667; }
          open-focused false
          open-on-workspace "3"
        }

        window-rule {
          match app-id="com.ayugram.desktop" title="Media viewer"
          open-focused true
        }

        window-rule { 
          match app-id="org.prismlauncher.Prismlauncher"
          match app-id="Badlion Client"
          match app-id="libreoffice-writer"
          match app-id="net.lutris.Lutris"
          open-maximized true
          open-on-workspace "5"
        }

        window-rule { 
          match app-id="steam"
          open-focused false
          open-on-workspace "5"
          default-column-width { proportion 0.5; }
        }

        window-rule { 
          match app-id="com.github.wwmm.easyeffects"
          match app-id="io.github.seadve.Mousai"
          open-on-workspace "7"
        }

        window-rule { 
          match app-id="blender"
          match app-id="Blockbench"
          open-on-workspace "8"
        }

        window-rule { 
          match app-id="transmission-gtk"
          open-on-workspace "9"
        }

        window-rule { 
          match app-id="music"
          open-maximized true
          open-focused false
          open-on-workspace "10"
        }

        window-rule {
          match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
          default-floating-position x=10 y=10 relative-to="bottom-right"
        }

        binds {
          Mod+Shift+Slash { show-hotkey-overlay; }
          Mod+Space { toggle-overview; }

          Mod+Return { spawn "kitty" "-e" "tmux" "attach-session"; }
          Mod+D { spawn "anyrun"; }

          F3 allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03+"; }
          F2 allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.03-"; }
          Mod+F1 allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10+"; }
          MOd+F2 allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.10-"; }
          F1        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
          F4     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
          F7 { spawn "bluetoothctl" "connect" "CC:FF:90:42:64:45"; }

          F5 { spawn "sudo" "${pkgs.light}/bin/light" "-U" "10"; }
          F6 { spawn "sudo" "${pkgs.light}/bin/light" "-A" "10"; }

          Mod+P { spawn "hyprpicker" "-a"; }

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

          Mod+Ctrl+H     { focus-monitor-left; }
          Mod+Ctrl+J     { focus-monitor-down; }
          Mod+Ctrl+K     { focus-monitor-up; }
          Mod+Ctrl+L     { focus-monitor-right; }

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
          Mod+M { maximize-column; }
          Mod+Ctrl+F { fullscreen-window; }

          Print { screenshot-screen; }
          Mod+Print { screenshot; }
          Ctrl+Print { screenshot-window; }
          // Ctrl+Tab { screenshot-screen; }

          Mod+Shift+E { quit; }

          F12 { spawn "hyprlock"; }
          Mod+Insert { spawn "swaync-client" "-t" "-sw"; }

          Mod+Shift+P { power-off-monitors; }
        }
      '';
  };
}
