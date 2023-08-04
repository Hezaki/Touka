{ lib, pkgs, ... }: let
  mkTuple = lib.hm.gvariant.mkTuple;
in {
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.telegram.desktop.desktop"
      ];
    };

    "org/gnome/shell/keybindings" = {
      screenshot = [ "<Control>Delete" ];
      screenshot-window = [ "<Control>F12" ];
      show-screen-recording-ui = [ "<Shift>F11" ];
      show-screenshot-ui = [ "<Alt>F12" ];
      switch-to-application-1 = [ "<Super>1" ];
      switch-to-application-2 = [ "<Super>2" ];
      switch-to-application-3 = [ "<Super>3" ];
      switch-to-application-4 = [ "<Super>4" ];
      switch-to-application-5 = [ "<Super>5" ];
      switch-to-application-6 = [ "<Super>6" ];
      toggle-application-view = [];
      toggle-message-tray = [];
      toggle-overview = [];
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
      xkb-options = [ "lv3:ralt_switch" "grp:win_space_toggle" ];
    };

    
    "org/gnome/desktop/interface" = {
      color-scheme = "Catppuccin-Mocha-Compact-Lavender-dark";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/hezaki/.walppapi/rose01.png";
      picture-uri-dark = "file:///home/hezaki/.walppapi/rose01.png";
    };

    "org/gnome/photos" = {
      window-maximized = true;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "dash-to-dock@micxgx.gmail.com"
        ];
      # "org/gnome/shell/extensions/user-theme" = {
      #   name = "Catppuccin-Mocha-Compact-Lavender-dark";
      # };
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    dconf2nix
  ];
}
