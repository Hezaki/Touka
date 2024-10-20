{ pkgs, inputs, config, ... }:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./images/wp.png;
    polarity = "dark";
    base16Scheme = {
      base00 = "#151515";
      base01 = "#1F1F1F";
      base02 = "#2E2E2E";
      base03 = "#424242";
      base04 = "#BBB6B6";
      base05 = "#E8E3E3";
      base06 = "#E8E3E3";
      base07 = "#E8E3E3";
      base08 = "#B66467";
      base09 = "#D9BC8C";
      base0A = "#D9BC8C";
      base0B = "#8C977D";
      base0C = "#8AA6A2";
      base0D = "#8DA3B9";
      base0E = "#A988B0";
      base0F = "#BBB6B6";
    };
    cursor = {
      name = "GoogleDot-White";
      package = pkgs.google-cursor;
      size = 21;
    };
    fonts = {
      serif = {
        name = "JetBrainsMono NerdFont";
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      };
      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-emoji;
      sizes.terminal = 13;
    };
    targets = {
      vesktop.enable = false;
      neovim.enable = false;
      gtk.extraCss = with config.lib.stylix.colors; ''
        @define-color headerbar_bg_color #${base00};
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
  qt.enable = true;
}
