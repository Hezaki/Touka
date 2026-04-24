{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = with inputs; [ stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    image = ./images/wp.png;
    polarity = "dark";
    enableReleaseChecks = false;

    base16Scheme = {
      base00 = "#121316";
      base01 = "#1e2022";
      base02 = "#272A2F";
      base03 = "#323539";
      base04 = "#E0E2E8";
      base05 = "#e9e1d9";
      base06 = "#F2F3F9";
      base07 = "#50462a";
      base08 = "#e62d42";
      base09 = "#ed5b00";
      base0A = "#c88800";
      base0B = "#3a944a";
      base0C = "#2190a4";
      base0D = "#3584e4";
      base0E = "#9141ac";
      base0F = "#d56199";
    };

    cursor = {
      name = "Bibata-Modern-Custom";
      package = inputs.nix-cursors.packages.${pkgs.system}.bibata-modern-cursor.override {
        background_color = "#${config.lib.stylix.colors.base00}";
        outline_color = "#${config.lib.stylix.colors.base06}";
        accent_color = "#${config.lib.stylix.colors.base00}";
      };
      size = 20;
    };

    fonts = {
      serif = {
        name = "JetBrainsMono NerdFont";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-color-emoji;
      sizes.terminal = 16;
    };

    targets = {
      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
      qt.enable = true;
      mpv.enable = true;
      noctalia-shell.enable = false;
      firefox.profileNames = [ "hqzk" ];

      gtk.extraCss =
        with config.lib.stylix.colors; # css
        ''
          * {
            border-radius = 13px
          }

          /* @define-color headerbar_bg_color #${base00}; */
          /* @define-color sidebar_bg_color #${base00}; */
        '';
    };
  };

  gtk = {
    enable = true;
    gtk4.enable = true;

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt.enable = true;
}
