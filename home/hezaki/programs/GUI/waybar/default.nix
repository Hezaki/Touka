{ config, pkgs, inputs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa: {
      mesonFlags = (oa.mesonFlags or []) ++ ["-Dexperimental=true"];
    });
    settings = [{
      layer = "bottom";
      position = "bottom"; 
      height = 1;
      
      modules-left = ["custom/launcher" "custom/separator" "wlr/workspaces" "pulseaudio" "hyprland/language"];
      modules-center = ["hyprland/window"];
      modules-right =  ["custom/date" "clock#time" "temperature" "battery"];

      "wlr/workspaces" = {
        all-outputs = true;
        sort-by-number = true;
        format = "{icon}";
        on-click = "activate";
        format-icons = {
            "default" = "";
            "urgent" = "";
            "active" = "";
        };
      };

      "custom/date" = {
        interval = 1;
        exec = "date +\" %e %b\"";
      };
      
      "clock#time" = {
        format = " {:%H:%M:%S}";
        interval = 1;
        tooltip = false;
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " muted";
        scroll-step = 5;
        on-click = "wpctl set-mute 0 toggle";
        format-icons = {
          headphone = " ";
          hands-free = " ";
          headset = " ";
          default = ["" "" "墳" " "];
        };
      };
      
      battery = {
        states = {
          warning = 30;
          critical = 15;
          };
        format = "{icon} {capacity}%";
        format-charging = "{capacity}% 󰂅 ";
        format-plugged = "{capacity}%  ";
        format-alt = "{time} {icon}";
        format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        "battery#bat2" = {
            bat = "bat2";
        };

      "hyprland/window" = {
        format = "{}";
        max-length = 35;
      };

      "hyprland/language" = {
        format = "󰌌 {}";
        interval = 1;
        format-en = "US";
        format-ru = "RU";
      };

      temperature = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = [""];
        };
      
      "custom/separator" = {
        format = "<span foreground='#ebdbb2'>|</span>";
        interval = 1;
      };

      "custom/launcher" = {
        format = "<span font='14'></span> {}";
        on-click = "foot -e doas nvim /etc/nixos";
      };
    }];
    style = ''
        * {
          font-family: JetBrainsMono NerdFont, SourceHanSansJP;
          font-weight: bold;
          font-size: 13px;
        }

        window#waybar {
          background-color: transparent;
          color: #ebdbb2;
        }

        window#waybar > box {
          margin: 5px 0px 0px 0px;
          background-color: #1d2021;
          border-top: 2px;
          border-color: #282828;
          border-style: solid;
          border-radius: 20 20 0 0px;
          box-shadow: 1 1 3 1px #101010;
        }

        #workspaces button {
          padding: 0 0.5em;
          /* margin-right: 0px; */
          /* margin-left: 0px; */
          color: #ebdbb2;
        }

        #workspaces button.active {
          color: #ebdbb2;
          background: #282828;
        }

        #workspaces button.focused {
          color: #ebdbb2;
          background: #282828;
        }

        #workspaces button.urgent {
          color: #cc241d;
          background: #282828;
        }

        #workspaces button:hover {
          background: #1d2021;
          color: #ebdbb2;
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
          background: #282828;
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
          background: #1d2021;
          padding: 0 0.6em;
          margin-right: 0px;
          margin-left: 0px;
          margin-top: 4px;
          margin-bottom: 4px;
        }

        #pulseaudio {
          margin-right: 2px;
          margin-left: 2px;
          color: #ebdbb2;
        }

        #clock {
          color: #ebdbb2;
          margin-right: 2px;
          margin-left: 2px;
        }

        #custom-date {
          margin-right: 2px;
          margin-left: 2px;
          border-radius: 11 0 0 11px;
        }

        #battery {
          color: #ebdbb2;
          margin-right: 10px;
          margin-left: 2px;
          border-radius: 0 11 11 0px;
        }

        #window {
          color: #ebdbb2;
          background: #1d2021;
          padding: 0 0.6em;
          margin-right: 4px;
          margin-left: 4px;
          margin-top: 4px;
          margin-bottom: 4px;
          background: radial-gradient(circle, #1d2021)
        }

        #language {
          color: #ebdbb2;
          padding: 0 0.6em;
          margin-right: 2px;
          margin-left: 2px;
          margin-top: 4px;
          margin-bottom: 4px;
          border-radius: 0 11 11 0px;
        }

        #temperature {
          color: #ebdbb2;
          padding: 0 0.6em;
          margin-right: 2px;
          margin-left: 2px;
          margin-top: 4px;
          margin-bottom: 4px;
        }
      
        #custom-launcher {
          color: #458588;
          background: #282828;
          padding: 0 0.6em;
          margin-left: 10px;
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
