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
            trigger = ":cbdots";
            replace = "https://codeberg.org/Hezaki/Touka/";
          }
          {
            trigger = ":ghdots";
            replace = "https://github.com/Hezaki/Touka/";
          }
          {
            trigger = ":gldots";
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
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = {format = "%d/%m/%Y";};
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
