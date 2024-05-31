{ pkgs, config, ... }:{
  home.packages = with pkgs; [ waybar ];
  # base00: "#0f0f0f"
  # base01: "#191919"
  # base02: "#262626"
  # base03: "#4c4c4c"
  # base04: "#ac8a8c"
  # base05: "#cacaca"
  # base06: "#e7e7e7"
  # base07: "#f0f0f0"
  # base08: "#ac8a8c"
  # base09: "#ceb188"
  # base0A: "#aca98a"
  # base0B: "#8aac8b"
  # base0C: "#8aabac"
  # base0D: "#8f8aac"
  # base0E: "#ac8aac"
  # base0F: "#ac8a8c"
  xdg.configFile = {
    "waybar/config.jsonc".text = ''
		{
		"battery": {
			"format": "{icon} {capacity}%",
			"format-alt": "{icon} {time} ",
			"format-charging": "<span color='#${config.lib.stylix.colors.base06}'>󰂅</span> {capacity}%",
			"format-icons": [
			"<span color='#${config.lib.stylix.colors.base06}'>󰁺</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰁻</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰁼</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰁽</span>",
		  "<span color='#${config.lib.stylix.colors.base06}'>󰁾</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰁿</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰂀</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰂁</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰂂</span>",
			"<span color='#${config.lib.stylix.colors.base06}'>󰁹</span>"
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
			"format": "<span color='#${config.lib.stylix.colors.base06}'></span> {:%H:%M:%S}",
			"interval": 1,
			"tooltip": false
		},
		"custom/date": {
			"exec": "date +\"<span color='#${config.lib.stylix.colors.base06}'>󰸘</span> %e %b\"",
			"interval": 1
		},
		"custom/launcher": {
			"format": "<span color='#${config.lib.stylix.colors.base06}' font='17'></span> {}",
		},
		"custom/separator": {
			"format": "<span color='#${config.lib.stylix.colors.base06}'>|</span>",
			"interval": 1
		},
		"height": 1,
		"hyprland/language": {
			"format": "<span color='#${config.lib.stylix.colors.base06}'>󰌌</span> {}",
			"format-en": "US",
			"format-ru": "RU",
      "keyboard-name": "at-translated-set-2-keyboard",
			"interval": 1
		},
		"wlr/taskbar": {
			"format": "{icon}",
			"icon-size": 20,
			"tooltip-format": "{title}",
		},
		"hyprland/window": {
			"format": "{}",
			"max-length": 35
		},
		"backlight": {
			"device": "intel_backlight",
			"format": "{icon}{percent}% ",
			"format-icons": [" ", " "]
		},
		"layer": "top",
		"modules-center": [
			"hyprland/workspaces",
		],
		"modules-left": [
			"custom/launcher",
			"hyprland/language",
			"pulseaudio",
			"backlight"
		],
		"modules-right": [
			"custom/date",
			"clock#time",
			"battery"
		],
		"position": "bottom",
		"pulseaudio": {
			"format": "{icon} {volume}%",
			"format-icons": {
		  "default": [
			   "<span color='#${config.lib.stylix.colors.base06}'></span>",
			   "<span color='#${config.lib.stylix.colors.base06}'></span>",
			   "<span color='#${config.lib.stylix.colors.base06}'></span>"
			 ],
			"hands-free": "<span color='#${config.lib.stylix.colors.base06}'></span>",
				"headphone": "<span color='#${config.lib.stylix.colors.base06}'></span>",
				"headset": "<span color='#${config.lib.stylix.colors.base06}'></span>"
			},
			"format-muted": "<span color='#${config.lib.stylix.colors.base06}'>󰝟</span> mute",
			"on-click": "wpctl set-mute @deFAULT_AUDIO_SINK@ toggle",
			"scroll-step": 3
		},
		"temperature": {
				"critical-threshold": 80,
				"format": "{icon} {temperatureC}°C",
				"format-icons": [
			  "<span color='#${config.lib.stylix.colors.base06}'></span>"
			]
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
    "waybar/style.css".text = ''
      * {
        font-family: JetBrainsMono NerdFont, SourceHanSansJP;
        font-weight: bold;
        font-size: 16px;
      }

      window#waybar {
        background-color: transparent;
        color: #${config.lib.stylix.colors.base06};
      }

      window#waybar > box {
        margin: 5px 0px 0px 0px;
        background-color: #${config.lib.stylix.colors.base00};
        border-top: 0px;
        border-bottom: 0;
        border-style: solid;
        border-color: #3C3836;
        box-shadow: 1 1 3 1px #101010;
      }

      #workspaces button {
        background-color: #${config.lib.stylix.colors.base03};
        border-radius: 20px;
        margin: 2px;
        padding: 0px;
        padding-right: 6px;
        padding-left: 6px;
        color: #${config.lib.stylix.colors.base06};
        min-height: 25px;
        transition: all 0.4s ease-in-out;
      }

      #workspaces button label{
        color: #${config.lib.stylix.colors.base06};
        font-weight: bolder;
      }

      #workspaces button.empty{
        background: #${config.lib.stylix.colors.base02};
      }

      #workspaces button.active {
        background: radial-gradient(circle, #${config.lib.stylix.colors.base06} 0%, #${config.lib.stylix.colors.base0D} 50%, #${config.lib.stylix.colors.base0B} 100%); 
        background-size: 400% 400%;
        animation: gradient 5s linear infinite;
        transition: all 0.3s ease-in-out;
        border-color: #45475a;
      }

      #workspaces button.active label {
        color: #${config.lib.stylix.colors.base02};
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
        color: #${config.lib.stylix.colors.base06};
        background: #${config.lib.stylix.colors.base00};
        padding: 0 0.6em;
        margin: 0 0 0 0px;
        padding-top: 0px;
        padding-bottom: 2px;
        border-style: solid;
        min-height: 30px;
      }

      #tray {
        margin-right: 6px;
      }

      #custom-separator {
        padding: 0 3 0 0px;
        background: #${config.lib.stylix.colors.base00};
      }

      #pulseaudio {
        padding: 0 0.6em;
        margin: 4 4 4 4px;
        border-radius: 4 14 14 4px;
      }

      #backlight {
        padding: 0 0.6em;
        margin: 4 4 4 4px;
      }

      #clock {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 4 14 14 4px;
      }

      #custom-date {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 14 4 4 14px;
      }

      #battery {
        padding: 0 0.6em;
        margin: 3 6 3 4px;
        border-radius: 14 14 14 14px;
      }

      #language {
        padding: 0 0.6em;
        margin: 3 4 3 0px;
        border-radius: 14 4 4 14px;
      }

      #temperature {
        padding: 0 0.6em;
        margin: 3 4 3 4px;
        border-radius: 14 14 14 14px;
      }

      #custom-launcher {
        /* padding: 0 0.6em; */
        margin-left: 0px;
        margin-right: 0px;
        padding: 0 0.6em;
        border-radius: 0 20 0 0px;
      }

      #workspaces {
        background: #${config.lib.stylix.colors.base00};
        padding: 0em;
        margin: 3 0 3 0px;
        border-radius: 14 14 14 14px;
      }
    '';
   };
}
