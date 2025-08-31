{ pkgs, config, ... }:
{
  xdg = with config.home; {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
      music = null;
      download = "${homeDirectory}/Downloads";
      documents = "${homeDirectory}/Documents";
      videos = "${homeDirectory}/Media/Videos";
      pictures = "${homeDirectory}/Media/Screenshots";
      extraConfig = {
        XDG_REPO_DIR = "${homeDirectory}/Downloads/Repositories";
        XDG_PIC_DIR = "${homeDirectory}/Downloads/Pictures";
        XDG_VID_DIR = "${homeDirectory}/Downloads/Videos";
      };
    };

    portal = {
      enable = true;
      config = {
        common = {
          default = "*";
          "org.freedesktop.impl.portal.Screencast" = "niri";
          "org.freedesktop.impl.portal.Screenshot" = "niri";
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
    };
  };
}
