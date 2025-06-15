{
  xdg.configFile = {
    "hypr/scripts/defSreenshot.sh".text = # bash
      ''
        #!/usr/bin/env bash
        DIR="$HOME/Media/Screenshots"
        [ ! -d "$DIR" ] && mkdir -p "$DIR"
        FILENAME="$DIR/$(date +%Y%m%d_%Hh%Mm%Ss.png)"
        OUTPUT=$(slurp -o)
        [ -z "$OUTPUT" ] && exit 1
        grim -g "$OUTPUT" "$FILENAME"
        wl-copy < "$FILENAME"
        notify-send -a "Screenshot" -i "$FILENAME" "Screenshot taken !!!" "$FILENAME"
      '';
    "hypr/scripts/rules.sh".text = # bash
      ''
        #!/usr/bin/env bash
        read -r -d "" EDP1_RULES << 'EOF'
        windowrule = workspace 2, class:firefox
        windowrule = workspace 3, class:com.ayugram.desktop
        windowrule = workspace 4, class:vesktop
        windowrule = workspace 5, class:org.prismlauncher.PrismLauncher
        windowrule = workspace 5, class:Badlion Client
        windowrule = workspace 5, class:libreoffice-writer
        windowrule = workspace 5, class:steam
        windowrule = workspace 5, class:net.lutris.Lutris
        windowrule = workspace 6, class:org.pwmt.zathura
        windowrule = workspace 7, class:org.pulseaudio.pavucontrol
        windowrule = workspace 7, class:com.github.wwmm.easyeffects
        windowrule = workspace 8, class:blender
        windowrule = workspace 8, class:Blockbench
        windowrule = workspace 9, class:transmission-gtk
        windowrule = workspace 10, class:com.github.th_ch.youtube_music
        EOF

        read -r -d "" DP2_RULES << 'EOF'
        windowrule = workspace 12, class:firefox
        windowrule = workspace 13, class:com.ayugram.desktop
        windowrule = workspace 14, class:vesktop
        windowrule = workspace 15, class:org.prismlauncher.prismlauncher
        windowrule = workspace 15, class:badlion client
        windowrule = workspace 15, class:libreoffice-writer
        windowrule = workspace 15, class:steam
        windowrule = workspace 15, class:net.lutris.lutris
        windowrule = workspace 16, class:org.pwmt.zathura
        windowrule = workspace 17, class:org.pulseaudio.pavucontrol
        windowrule = workspace 17, class:com.github.wwmm.easyeffects
        windowrule = workspace 18, class:blender
        windowrule = workspace 18, class:blockbench
        windowrule = workspace 19, class:transmission-gtk
        windowrule = workspace 20, class:com.github.th_ch.youtube_music
        EOF

        apply_monitor_rules() {
            local rules="$1"
            echo "Wait..."
            echo "$rules" | while IFS= read -r rule; do
                local trimmed_rule=$(echo "$rule" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
                if [[ -n "$trimmed_rule" && "$trimmed_rule" =~ ^windowrule\ =\ (.*) ]]; then
                    local rule_content=$(echo "$trimmed_rule" | sed -e 's/^windowrule = //')
                    hyprctl keyword windowrule "$rule_content"
                fi
            done
            echo "Done."
        }

        MONITOR_INFO=$(hyprctl monitors all)

        if echo "$MONITOR_INFO" | grep -q "Monitor eDP-1" && echo "$MONITOR_INFO" | awk '/Monitor eDP-1/,/focused:/' | grep -q "focused: yes"; then
            echo "eDP-1 focus."
            apply_monitor_rules "$EDP1_RULES"
        elif echo "$MONITOR_INFO" | grep -q "Monitor DP-2" && echo "$MONITOR_INFO" | awk '/Monitor DP-2/,/focused:/' | grep -q "focused: yes"; then
            echo "DP-2 focus."
            apply_monitor_rules "$DP2_RULES"
        else
            echo "Not working."
        fi
      '';
  };
}
