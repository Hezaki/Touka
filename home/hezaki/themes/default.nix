{ config, pkgs, ... }: {
  home.pointerCursor = {
    package = pkgs.capitaine-cursors-themed;
    name = "Capitaine Cursors (Gruvbox)"; 
    size = 22;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font.name = "JetBrainsMono 11";
    theme = {
      name = "Gruvbox-Dark-BL-LB";
      package = pkgs.gruvbox-gtk-theme;
    };
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

  home.sessionVariables = {
    GTK_THEME = "${config.gtk.theme.name}";
  };
}
