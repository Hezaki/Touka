{
  config,
  lib,
  pkgs,
  ...
}:

let
  terminal = "rio";
  wrapperScript = "${config.home.homeDirectory}/.config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh";
in
{
  xdg = with config.home; {
    enable = true;

    portal = {
      enable = true;
      xdgOpenUsePortal = true;

      extraPortals = lib.mkForce [
        pkgs.xdg-desktop-portal-termfilechooser
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gtk
      ];

      config = {
        common = lib.mkForce {
          "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
          "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
          "org.freedesktop.impl.portal.Settings" = [ "gtk" ];

          default = [
            "termfilechooser"
            "wlr"
            "gtk"
          ];
        };
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      music = "${homeDirectory}/Music";
      download = "${homeDirectory}/Downloads";
      documents = "${homeDirectory}/Documents";
      videos = "${homeDirectory}/Videos";
      pictures = "${homeDirectory}/Pictures";
      projects = "${homeDirectory}/Projects";
      templates = null;
      publicShare = null;
      extraConfig = {
        XDG_REPO_DIR = "${homeDirectory}/Downloads/Repository";
        XDG_PIC_DIR = "${homeDirectory}/Downloads/Pictures";
        XDG_VID_DIR = "${homeDirectory}/Downloads/Videos";
      };
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/about" = [ "firefox.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox.desktop" ];
        "image/jpeg" = [ "swayimg.desktop" ];
        "image/png" = [ "swayimg.desktop" ];
        "image/gif" = [ "swayimg.desktop" ];
        "image/webp" = [ "swayimg.desktop" ];
        "image/svg+xml" = [ "swayimg.desktop" ];
        "image/bmp" = [ "swayimg.desktop" ];
        "image/tiff" = [ "swayimg.desktop" ];
        "inode/directory" = [ "yazi.desktop" ];
        "x-scheme-handler/terminal" = [ "${terminal}.desktop" ];
        "application/x-terminal-emulator" = [ "${terminal}.desktop" ];
        "text/*" = [ "neovim.desktop" ];
      };
    };
  };

  home.file.".config/xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${wrapperScript}
    default_dir=$$HOME
    env=TERMCMD=${terminal}
  '';

  home.file.".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      set -eu

      multiple="$1"
      directory="$2"
      save="$3"
      path="$4"
      out="$5"

      termcmd="''${TERMCMD:-${terminal}}"

      escape() {
          printf "%s" "$1" | sed 's/"/\\"/g'
      }

      get_work_dir() {
          local p="$1"
          if [ -n "$p" ] && [ "$p" != "''${HOME}" ]; then
              if [ -f "$p" ]; then
                  dirname "$p"
              else
                  echo "$p"
              fi
          else
              echo "''${HOME}"
          fi
      }

      work_dir=$(get_work_dir "$path")

      if [ "$save" = "1" ]; then
          exec $termcmd --working-dir="$work_dir" -e yazi --chooser-file="$(escape "$out")" "$(escape "$path")"
      elif [ "$directory" = "1" ]; then
          exec $termcmd --working-dir="$work_dir" -e yazi --chooser-file="$(escape "$out")" --cwd-file="$(escape "$out")" "$(escape "$path")"
      elif [ "$multiple" = "1" ]; then
          exec $termcmd --working-dir="$work_dir" -e yazi --chooser-file="$(escape "$out")" "$(escape "$path")"
      else
          exec $termcmd --working-dir="$work_dir" -e yazi --chooser-file="$(escape "$out")" "$(escape "$path")"
      fi
    '';
  };
}
