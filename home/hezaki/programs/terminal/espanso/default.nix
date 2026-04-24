{ pkgs, ... }:
{
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    matches = {
      base = {
        matches = [
          {
            trigger = ":date";
            replace = "{{currentdate}}";
          }

          {
            trigger = ":time";
            replace = "{{currenttime}}";
          }

          {
            trigger = ":rock";
            replace = "🗿";
          }

          {
            trigger = ":heart";
            replace = "❤️";
          }

          {
            trigger = ":lisp";
            replace = "💋";
          }

          {
            trigger = ":oops";
            replace = "👉👈";
          }

          {
            trigger = ":eye";
            replace = "👀";
          }

          {
            trigger = ":hmm";
            replace = "🤨";
          }

          {
            trigger = ":lyv";
            replace = "😘";
          }

          {
            trigger = ":cool";
            replace = "😎";
          }

          {
            trigger = ":x";
            replace = "❌";
          }

          {
            trigger = ":cummunism";
            replace = "☭";
          }

          {
            trigger = ":copyright";
            replace = "©";
          }

          {
            trigger = ":```";
            replace = "```$|$```";
          }

          {
            trigger = ":--";
            replace = "—";
          }

          {
            trigger = ":<";
            replace = "«$|$»";
          }

          {
            trigger = '':"'';
            replace = ''"$|$"'';
          }

          {
            trigger = ":'";
            replace = "'$|$'";
          }

          {
            trigger = ":'";
            replace = "'$|$'";
          }

          {
            trigger = ":wallpaper";
            image_path = "/etc/nixos/home/hezaki/themes/images/wp.png";
          }
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = {
              format = "%d.%m.%Y";
            };
          }

          {
            name = "currenttime";
            type = "date";
            params = {
              format = "%R";
            };
          }
        ];
      };
    };
    configs = {
      default = {
        show_notifications = false;
      };
    };
  };
}
