{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = ./images/nebokakoeto.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    cursor = {
      name = "GoogleDot-White";
      package = pkgs.google-cursor;
      size = 21;
    };
    fonts = {
      serif = {
        name = "JetBrainsMono";
        package = pkgs.jetbrains-mono;
      };
      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-emoji;
      sizes.terminal = 13;
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
