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
            trigger = ":cb.d";
            replace = "https://codeberg.org/Hezaki/Touka/";
          }
          {
            trigger = ":gh.d";
            replace = "https://github.com/Hezaki/Touka/";
          }
          {
            trigger = ":gl.d";
            replace = "https://gitlab.com/Hezaki/Touka/";
          }
          {
            trigger = ":nixs";
            replace = "https://search.nixos.org/";
          }
          {
            trigger = ":hms";
            replace = "https://home-manager-options.extranix.com/";
          }
          {
            trigger = ":yt";
            replace = "https://youtube.com/";
          }
          {
            trigger = ":ytm";
            replace = "https://music.youtube.com/";
          }
          {
            trigger = ":codeberg";
            replace = "https://codeberg.org/";
          }
          {
            trigger = ":github";
            replace = "https://github.com/";
          }
          {
            trigger = ":gitlab";
            replace = "https://gitlab.com/";
          }
          {
            trigger = ":nixpkgs";
            replace = "https://github.com/NixOS/nixpkgs/";
          }
          {
            trigger = ":reddit";
            replace = "https://www.reddit.com/";
          }
          {
            trigger = ":r/unixporn";
            replace = "https://www.reddit.com/r/unixporn";
          }
          {
            trigger = ":r/neovim";
            replace = "https://www.reddit.com/r/neovim";
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
            trigger = ":cummunism";
            replace = "☭";
          }
          {
            trigger = ":copyright";
            replace = "☭";
          }
          {
            trigger = ":```";
            replace = "```$|$```";
          }
          {
            trigger = ":_-";
            replace = "—";
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
            params = {format = "%d.%m.%Y";};
          }
          {
            name = "currenttime";
            type = "date";
            params = {format = "%R";};
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
