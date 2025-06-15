{
  pkgs,
  pkgsStable,
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

    base16Scheme = {
      base00 = "#0d0c0c";
      base01 = "#12120f";
      base02 = "#1D1C19";
      base03 = "#282727";
      base04 = "#727169";
      base05 = "#DCD7BA";
      base06 = "#C8C093";
      base07 = "#717C7C";
      base08 = "#C34043";
      base09 = "#FFA066";
      base0A = "#C0A36E";
      base0B = "#76946A";
      base0C = "#6A9589";
      base0D = "#7E9CD8";
      base0E = "#957FB8";
      base0F = "#D27E99";
    };

    cursor = {
      name = "GoogleDot-Custom";
      package = inputs.nix-cursors.packages.${pkgs.system}.google-cursor.override {
        background_color = "#${config.lib.stylix.colors.base03}";
        outline_color = "#${config.lib.stylix.colors.base06}";
        accent_color = "#${config.lib.stylix.colors.base03}";
      };
      size = 21;
    };

    fonts = {
      serif = {
        name = "JetBrainsMono NerdFont";
        package = pkgsStable.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      };

      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-emoji;
      sizes.terminal = 14;
    };

    targets = {
      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
      qt.enable = true;

      gtk.extraCss = with config.lib.stylix.colors; ''
        @define-color headerbar_bg_color #${base00};
        @define-color sidebar_bg_color #${base00};
      '';
    };
  };

  gtk = {
    enable = true;

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
}
