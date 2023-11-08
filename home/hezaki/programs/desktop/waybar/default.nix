{
  programs.waybar.enable = true;
  xdg.configFile = {
    "waybar/config.jsonc".text = ''
      {
        "battery": {
          "format": "{icon} {capacity}%",
          "format-alt": "{time} {icon}",
          "format-charging": "{capacity}% 󰂅 ",
          "format-icons": [
            "󰁺",
            "󰁻",
            "󰁼",
            "󰁽",
            "󰁾",
            "󰁿",
            "󰂀",
            "󰂁",
            "󰂂",
            "󰁹"
          ],
          "format-plugged": "{capacity}%  ",
          "states": {
            "critical": 15,
            "warning": 30
          }
        },
        "battery#bat2": {
          "bat": "bat2"
        },
        "clock#time": {
          "format": " {:%H:%M:%S}",
          "interval": 1,
          "tooltip": false
        },
        "custom/date": {
          "exec": "date +\"󰸘 %e %b\"",
          "interval": 1
        },
        "custom/launcher": {
          "format": "<span font='14'></span> {}",
        },
        "custom/separator": {
          "format": "<span foreground='#cdd6f4'>|</span>",
          "interval": 1
        },
        "height": 1,
        "hyprland/language": {
          "format": "󰌌 {}",
          "format-en": "US",
          "format-ru": "RU",
          "interval": 1
        },
        "hyprland/window": {
          "format": "{}",
          "max-length": 35
        },
        "layer": "bottom",
        "modules-center": [
          "hyprland/window"
        ],
        "modules-left": [
          "custom/launcher",
          "custom/separator",
          "hyprland/workspaces",
          "pulseaudio",
          "hyprland/language"
        ],
        "modules-right": [
          "custom/date",
          "clock#time",
          "temperature",
          "battery"
        ],
        "position": "bottom",
        "pulseaudio": {
          "format": "{icon} {volume}%",
          "format-icons": {
            "default": [
              "",
              "",
              " "
            ],
            "hands-free": " ",
            "headphone": " ",
            "headset": " "
          },
          "format-muted": " muted",
          "on-click": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
          "scroll-step": 5
        },
        "temperature": {
          "critical-threshold": 80,
          "format": "{icon} {temperatureC}°C",
          "format-icons": [
            ""
          ]
        },
        "hyprland/workspaces": {
          "all-outputs": true,
          "format": "{icon}",
          "format-icons": {
            "active": "",
            "default": "",
            "urgent": ""
          },
        }
      }
    '';
    "waybar/style.css".text = ''
      * {
        font-family: JetBrainsMono NerdFont, SourceHanSansJP;
        font-weight: bold;
        font-size: 13px;
      }

      window#waybar {
        background-color: transparent;
        color: #1E1E28;
      }

      window#waybar > box {
        margin: 4px 150px 5px 150px;  /* 3 - 6 */
        background-color: #1e1e2e;
        border-top: 0px;
        /* border-color: #282828; */
        border-style: solid;
        border-radius: 11 11 11 11px;
        box-shadow: 1 1 3 1px #101010;
        /* box-shadow: 0px 0px 5px 5px rgba(0, 0, 0, 0.1); */
      }

      #workspaces button {
        padding: 0 0.5em;
        /* margin-right: 0px; */
        /* margin-left: 0px; */
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #cdd6f4;
        background: #313244;
      }

      #workspaces button.focused {
        color: #cdd6f4;
        background: #313244;
      }

      #workspaces button.urgent {
        color: #cdd6f4;
        background: #313244;
      }

      #workspaces button:hover {
        color: #cdd6f4;
        background: #313244;
      }

      #custom-date,
      #battery,
      #clock,
      #pulseaudio,
      #workspaces,
      #window,
      #language,
      #temperature,
      #text,
      #custom-launcher,

      #tray {
        color: #cdd6f4;
        background: #313244;
        padding: 0 0.6em;
        margin-right: 4px;
        margin-left: 4px;
        margin-top: 4px;
        margin-bottom: 4px;
        /* border-radius: 11px; */
        border-style: solid;
      }

      #tray {
        margin-right: 6px;
      }

      #custom-separator {
        background: #1E1E28;
        padding: 0 0.6em;
        margin-right: 0px;
        margin-left: 0px;
        margin-top: 4px;
        margin-bottom: 4px;
      }

      #pulseaudio {
        margin-right: 2px;
        margin-left: 2px;
      }

      #clock {
        margin-right: 2px;
        margin-left: 2px;
      }

      #custom-date {
        margin-right: 2px;
        margin-left: 2px;
        border-radius: 11 0 0 11px;
      }

      #battery {
        margin-right: 11px;
        margin-left: 2px;
        border-radius: 0 11 11 0px;
      }

      #window {
        padding: 0 0.6em;
        margin-right: 4px;
        margin-left: 4px;
        margin-top: 4px;
        margin-bottom: 4px;
        background: radial-gradient(circle, #1e1e2e)
      }

      #language {
        padding: 0 0.6em;
        margin-right: 2px;
        margin-left: 2px;
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 0 11 11 0px;
      }

      #temperature {
        padding: 0 0.6em;
        margin-right: 2px;
        margin-left: 2px;
        margin-top: 4px;
        margin-bottom: 4px;
      }

      #custom-launcher {
        background: #313244;
        padding: 0 0.6em;
        margin-left: 11px;
        margin-right: 0px;
        border-radius: 12px;
      }

      #workspaces {
        margin-right: 2px;
        margin-left: 0px;
        border-radius: 11 0 0 11px;
      }
    '';
  };
}
