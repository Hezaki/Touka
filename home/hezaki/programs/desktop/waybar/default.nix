{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ waybar ];
  xdg.configFile = {
    "waybar/config.jsonc".text = # json
      ''
        {
        "bluetooth": {
          "format": "󰂯 {status}",
          "format-connected": "󰂯 {device_battery_percentage}%",
          "tooltip-format": "{controller_alias}\t{controller_address}\n\n{num_connections} connected",
          "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}",
          "tooltip-format-enumerate-connected": "{device_alias}\t{device_address}",
          "tooltip-format-enumerate-connected-battery": "{device_alias}\t{device_address}\t{device_battery_percentage}%"
        },
        "tray": {
          "icon-size": 20,
          "spacing": 12
        },
        "battery": {
          "format": "{icon} {capacity}%",
          "format-alt": "{icon} {time} ",
          "format-charging": "󰂅  {capacity}%",
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
          "states": {
            "critical": 15,
            "warning": 30
          }
        },
        "battery#bat2": {
          "bat": "bat2"
        },
        "clock#time": {
          "format": "󰸘  {:%b %e}",
          "tooltip-format": "<tt>{calendar}</tt>",
          "interval": 1,
        },
        "custom/clock": {
          "exec": "date +\"  %H•%M\"",
          "interval": 1
        },
        "custom/separator": {
          "format": "/",
          "interval": 1
        },
        "height": 1,
        "hyprland/language": {
          "format": "󰌌  {}",
          "format-en": "en",
          "format-ru": "ru",
          "keyboard-name": "at-translated-set-2-keyboard",
          "interval": 1
        },
        "hyprland/window": {
          "format": "{}",
          "max-length": 35
        },
        "backlight": {
          "device": "intel_backlight",
          "format": "{icon} {percent}%",
          "format-icons": [" ", " "]
        },
        "layer": "top",
        "modules-center": [
          "hyprland/workspaces",
        ],
        "modules-left": [
          "backlight",
          "wireplumber",
          "hyprland/language",
          "bluetooth"
        ],
        "modules-right": [
          "tray",
          "clock#time",
          "custom/clock",
          "battery"
        ],
        "position": "top",
        "wireplumber": {
          "format": "{icon}  {volume}%",
          "format-icons": ["", "", ""],
          "format-muted": "󰝟  mute",
          "on-click": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
          "scroll-step": 3,
          "max-volume": 100.0
        },
        "temperature": {
          "critical-threshold": 80,
          "format": "{icon} {temperatureC}°C",
          "format-icons": [ "" ]
        },
        "hyprland/workspaces": {
          "on-click": "activate",
          "format": "{icon}",
          "format-icons": {
             "1":"一",
             "2":"二",
             "3":"三",
             "4":"四",
             "5":"五",
             "6":"六",
             "7":"七",
             "8":"八",
             "9":"九",
             "10":"十",
          },
          "persistent-workspaces": {
             "eDP-1": [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ],
            },
          },
        }
      '';
    "waybar/style.css".text =
      with config.lib.stylix.colors; # css
      ''
        * {
          font-family: Inter, SourceHanSansJP;
          font-weight: 700;
          font-size: 16px;
        }

        window#waybar {
          background-color: transparent;
          color: #${base06};
        }

        window#waybar > box {
          margin: 0px 0px 5px 0px;
          background-color: #${base00};
          border-top: 0px;
          border-bottom: 2px;
          border-style: solid;
          border-color: #${base01};
          padding-right: 1px;
          padding-left: 1px;
          box-shadow: 1 1 3 1px #101010;
        }

        #workspaces button {
          background-color: #${base03};
          border-radius: 20px;
          margin: 2px;
          padding: 0px;
          padding-right: 6px;
          padding-left: 6px;
          color: #${base06};
          min-height: 25px;
          transition: all 0.4s ease-in-out;
        }

        #workspaces button label{
          color: #${base06};
          font-weight: bolder;
        }

        #workspaces button.empty{
          background: #${base02};
        }

        #workspaces button.active {
          background: radial-gradient(circle, #${base06} 0%, #${base04} 50%, #${base0C} 100%); 
          background-size: 400% 400%;
          animation: gradient 5s linear infinite;
          transition: all 0.3s ease-in-out;
          border-color: #45475a;
        }

        #workspaces button.active label {
          color: #${base03};
          font-weight: bolder;
        }

        @keyframes gradient {
          0% {
            background-position: 0px 50px;
          }
          50% {
            background-position: 100px 30px;
          }
          100% {
            background-position: 0px 50px;
          }
        }

        @keyframes gradient_f {
          0% {
            background-position: 0px 200px;
          }
            50% {
                background-position: 200px 0px;
            }
          100% {
            background-position: 400px 200px;
          }
        }

        @keyframes gradient_f_nh {
          0% {
            background-position: 0px 200px;
          }
          100% {
            background-position: 200px 200px;
          }
        }

        #battery,
        #backlight
        #clock,
        #wireplumber,
        #workspaces,
        #window,
        #language,
        #text,
        #custom-launcher,
        #custom-separator,
        #custom-clock,
        #tray,
        #image-network,

        #tray {
          color: #${base06};
          background: #${base00};
          padding: 0 0.4em;
          padding-top: 0px;
          border-style: solid;
          min-height: 30px;
        }

        #tray {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #battery {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #backlight {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #custom-date {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #clock {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #custom-clock {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #language {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #wireplumber {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #bluetooth {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #image-network {
          margin: 3 4 3 4px;
          padding: 0 0.4em;
        }

        #custom-separator {
          padding: 0px;
          margin: 0px;
        }

        #custom-launcher {
          margin-left: 0px;
          margin-right: 0px;
          padding-right: 0.6em;
          border-radius: 0 20 20 0px;
        }

        #workspaces {
          margin: 3 0 3 0px;
          border-radius: 14 14 14 14px;
        }
      '';
  };
}
