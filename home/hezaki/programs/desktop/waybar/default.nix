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
          "format": "<span foreground='#89b4fa' font='14'></span> {}",
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
        "layer": "top",
        "modules-center": [
          "hyprland/workspaces",
        ],
        "modules-left": [
          "custom/launcher",
          "custom/separator",
          "hyprland/language",
          "pulseaudio",
          "temperature"
        ],
        "modules-right": [
          "custom/date",
          "clock#time",
          "battery"
        ],
        "position": "top",
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
          "format-muted": "󰝟 mute",
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
          // "format": "{}",
          // "format-icons": {
          //   "active": "",
          //   "default": "",
          //   "urgent": ""
          // },
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
        margin: 0px 0px 5px 0px;
        background-color: #1e1e2e;
        border-top: 0px;
        border-style: solid;
        box-shadow: 1 1 3 1px #101010;
      }

      #workspaces button label{
        color: 	#CDD6F4;
        font-weight: bolder;
      }

      #workspaces button.active label {
        color: #313244;
        font-weight: bolder;
      }

      #workspaces button {
        background-color: #45475a;
        border-color: #45475a;
        border-radius: 20px;
        margin-right: 10px;
        padding: 0px;
        padding-right: 6px;
        padding-left: 6px;
        font-weight: bolder;
        color: #313244;
        transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.68);
      }

      #workspaces button.active {
        padding-right: 14px;
        padding-left: 14px;
        padding-bottom: 0px;
        padding-top: 0px;
        background: rgb(203,166,247);
        background: radial-gradient(circle, rgba(205, 214, 244, 1) 0%, rgba(137, 180, 250, 1) 50%, rgba(203, 166, 247, 1) 100%); 
        background-size: 400% 400%;
        animation: gradient 5s linear infinite;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }

      @keyframes gradient {
	      0% {
		      background-position: 0% 50%;
	      }
	      50% {
		      background-position: 100% 30%;
	      }
	      100% {
		      background-position: 0% 50%;
	      }
      }

      @keyframes gradient_f {
	      0% {
		      background-position: 0% 200%;
	      }
          50% {
              background-position: 200% 0%;
          }
	      100% {
		      background-position: 400% 200%;
	      }
      }

      @keyframes gradient_f_nh {
	      0% {
		      background-position: 0% 200%;
	      }
	      100% {
		      background-position: 200% 200%;
	      }
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
        border-style: solid;
      }

      #tray {
        margin-right: 6px;
      }

      #custom-separator {
        background:	#313244;
        background-color: #1e1e2e;
        padding: 0 0.3em;
        margin-right: 0px;
        margin-left: 0px;
        margin-top: 4px;
        margin-bottom: 4px;
      }

      #pulseaudio {
        margin-right: 0px;
        margin-left: 0px;
      }

      #clock {
        margin-right: 0px;
        margin-left: 0px;
      }

      #custom-date {
        margin-right: 0px;
        margin-left: 0px;
        border-radius: 11 0 0 11px;
      }

      #battery {
        margin-right: 7px;
        margin-left: 0px;
        border-radius: 0 11 11 0px;
      }

      #window {
        padding: 0 0.6em;
        margin-right: 4px;
        margin-left: 4px;
        margin-top: 4px;
        margin-bottom: 4px;
        background: radial-gradient(circle, #313244)
      }

      #language {
        padding: 0 0.6em;
        margin-right: 0px;
        margin-left: 0px;
        margin-bottom: 4px;
        border-radius: 11 0 0 11px;
      }

      #temperature {
        padding: 0 0.6em;
        margin-right: 0px;
        margin-left: 0px;
        margin-top: 4px;
        margin-bottom: 4px;
        border-radius: 0 11 11 0px;
      }

      #custom-launcher {
        /* padding: 0 0.6em; */
        margin-left: 7px;
        margin-right: 0px;
        border-radius: 12px;
      }

      #workspaces {
        background: #1e1e2e;
        margin-right: 10px;
        margin-left: 25px;
      }
    '';
  };
}
