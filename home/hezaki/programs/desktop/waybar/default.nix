{
  programs.waybar.enable = true;
  xdg.configFile = {
    "waybar/config.jsonc".text = ''
      {
        "battery": {
          "format": "{icon} {capacity}%",
          "format-alt": "{icon} {time} ",
          "format-charging": "<span color='#89dceb'>󰂅</span> {capacity}%",
          "format-icons": [
            "<span color='#89dceb'>󰁺</span>",
            "<span color='#89dceb'>󰁻</span>",
            "<span color='#89dceb'>󰁼</span>",
            "<span color='#89dceb'>󰁽</span>",
            "<span color='#89dceb'>󰁾</span>",
            "<span color='#89dceb'>󰁿</span>",
            "<span color='#89dceb'>󰂀</span>",
            "<span color='#89dceb'>󰂁</span>",
            "<span color='#89dceb'>󰂂</span>",
            "<span color='#89dceb'>󰁹</span>"
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
          "format": "<span color='#a6e3a1'></span> {:%H:%M:%S}",
          "interval": 1,
          "tooltip": false
        },
        "custom/date": {
          "exec": "date +\"<span color='#f9e2af'>󰸘</span> %e %b\"",
          "interval": 1
        },
        "custom/launcher": {
          "format": "<span color='#89b4fa' font='14'></span> {}",
        },
        "custom/separator": {
          "format": "<span color='#cdd6f4'>|</span>",
          "interval": 1
        },
        "height": 1,
        "hyprland/language": {
          "format": "<span color='#cba6f7'>󰌌</span> {}",
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
              "<span color='#f38ba8'></span>",
              "<span color='#f38ba8'></span>",
              "<span color='#f38ba8'></span>"
            ],
            "hands-free": "<span color='#f38ba8'></span>",
            "headphone": "<span color='#f38ba8'></span>",
            "headset": "<span color='#f38ba8'></span>"
          },
          "format-muted": "<span color='#f38ba8'>󰝟</span> mute",
          "on-click": "wpctl set-mute @deFAULT_AUDIO_SINK@ toggle",
          "scroll-step": 3
        },
        "temperature": {
          "critical-threshold": 80,
          "format": "{icon} {temperatureC}°C",
          "format-icons": [
            "<span color='#fab387'></span>"
          ]
        },
        "hyprland/workspaces": {
          "on-click": "activate",
          "format": "{icon}",
          "format-icons": {
            "1":"1",
            "2":"2",
            "3":"3",
            "4":"4",
            "5":"5",
            "6":"6",
            "7":"7",
            "8":"8",
          },
          "persistent-workspaces": {
            "LVDS-1": [ 1, 2, 3, 4, 5, 6, 7, 8 ],
          },
        },
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
        border-bottom: 2;
        border-style: solid;
        border-color: #313244;
        box-shadow: 1 1 3 1px #101010;
      }

      #workspaces button {
        background-color: #45475a;
        border-color: #45475a;
        border-radius: 20px;
        margin: 2px;
        padding: 0px;
        padding-right: 3px;
        padding-left: 3px;
        color: #313244;
        min-height: 20px;
        transition: all 0.4s ease-in-out;
      }

      #workspaces button label{
        color: 	#CDD6F4;
        font-weight: bolder;
      }
      
      #workspaces button.empty{
        background: #313244;
      }

      /* #workspaces button.empty:first-child { */
      /*   border-top-left-radius: 9999px; */
      /*   border-bottom-left-radius: 9999px; */
      /* } */
      /**/
      /* #workspaces button.empty:last-child { */
      /*   border-top-right-radius: 9999px; */
      /*   border-bottom-right-radius: 9999px; */
      /* } */

      #workspaces button.active {
        background: radial-gradient(circle, rgba(205, 214, 244, 1) 0%, rgba(137, 180, 250, 1) 50%, rgba(203, 166, 247, 1) 100%); 
        background-size: 400% 400%;
        animation: gradient 5s linear infinite;
        transition: all 0.3s ease-in-out;
      }

      #workspaces button.active label {
        color: #313244;
        font-weight: bolder;
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
      #custom-separator,

      #tray {
        color: #cdd6f4;
        background: #313244;
        padding: 0 0.6em;
        margin: 0 0 0 0px;
        padding-top: 0px;
        padding-bottom: 2px;
        border-style: solid;
        min-height: 24px;
      }

      #tray {
        margin-right: 6px;
      }

      #custom-separator {
        padding: 0 3 0 3;
        background: #1E1E2E;
      }

      #pulseaudio {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 11 11 11 11px;
      }

      #clock {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 11 11 11 11px;
      }

      #custom-date {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 11 11 11 11px;
      }

      #battery {
        padding: 0 0.6em;
        margin: 3 6 3 4px;
        border-radius: 11 11 11 11px;
      }

      #language {
        padding: 0 0.6em;
        margin: 3 4 3 0px;
        border-radius: 11 11 11 11px;
      }

      #temperature {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 11 11 11 11px;
      }

      #custom-launcher {
        /* padding: 0 0.6em; */
        margin-left: 0px;
        margin-right: 0px;
        padding: 0 0.6em;
        border-radius: 0 15 0 0px;
      }

      #workspaces {
        background: #313244;
        padding: 0em;
        margin: 3 0 3 0px;
        border-radius: 11 11 11 11px;
      }
    '';
  };
}
