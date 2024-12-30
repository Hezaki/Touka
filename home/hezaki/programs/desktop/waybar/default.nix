{ pkgs, config, ... }:
let
  wifiBin = pkgs.writeShellScriptBin "wifi" ''
    quality=$(iwconfig 2> /dev/null | awk '
      /Link Quality/ {
        split($0, a, "=")
        split(a[2], b, "/")
        current_link_quality = b[1]
        max_link_quality = b[2]
        link_quality_percent = (current_link_quality / max_link_quality) * 100
        printf("%d\n", int(link_quality_percent + 0.5))
      }
    ')

    if (( "$quality" >= 0 && "$quality" < 20 )); then
      echo ${./assets/wifi0.png}
    elif (( "$quality" >= 20 && "$quality" < 40 )); then
      echo ${./assets/wifi1.png}
    elif (( "$quality" >= 40 && "$quality" < 60 )); then
      echo ${./assets/wifi2.png}
    elif (( "$quality" >= 60 && "$quality" < 80 )); then
      echo ${./assets/wifi3.png}
    elif (( "$quality" >= 80 && "$quality" <= 100 )); then
      echo ${./assets/wifi4.png}
    fi
  '';
in
{
  home.packages = with pkgs; [ waybar ];
  xdg.configFile = {
    "waybar/config.jsonc".text = ''
      		{
          "image#network": {
            "exec": "${pkgs.lib.getExe wifiBin}",
            "interval": 15,
            "size": 20,
          },
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
      			"format-charging": "<span color='#e9ecf2'>󰂅</span> {capacity}%",
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
            "format": "󰸘 {:%e %b   %H•%M}",
            "tooltip-format": "<tt>{calendar}</tt>",
            "interval": 1,
          },
      		"custom/launcher": {
            "format": "<span color='#7aaaff' font='17'></span> {}",
      		},
      		"custom/separator": {
      			"format": "/",
      			"interval": 1
      		},
      		"height": 1,
      		"hyprland/language": {
      			"format": "󰌌 {}",
      			"format-en": "US",
      			"format-ru": "RU",
            "keyboard-name": "at-translated-set-2-keyboard",
      			"interval": 1
      		},
      		"hyprland/window": {
      			"format": "{}",
      			"max-length": 35
      		},
      		"backlight": {
      			"device": "intel_backlight",
      			"format": "{icon}{percent}%",
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
      		  "image#network",
      		  "tray",
      			"custom/date",
      			"clock#time",
      			"battery"
      		],
      		"position": "top",
      		"wireplumber": {
      			"format": "{icon} {volume}%",
            "format-icons": ["", "", ""],
      			"format-muted": "󰝟 mute",
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
    "waybar/style.css".text = with config.lib.stylix.colors; ''
            * {
              font-family: JetBrainsMono NerdFont, SourceHanSansJP;
              font-weight: bold;
              font-size: 16px;
            }

            window#waybar {
              background-color: transparent;
              color: #${base06};
            }

            window#waybar > box {
              margin: 0px 0px 0px 0px;
              background-color: #${base00};
              border-top: 0px;
              border-bottom: 0;
              border-style: solid;
              border-color: #3C3836;
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
            #tray,
            #image-network,

            #tray {
              color: #${base06};
              background: #${base00};
              padding: 0 0.4em;
              padding-top: 0px;
              padding-bottom: 2px;
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
