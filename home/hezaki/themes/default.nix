{
  pkgs,
  pkgsStable,
  inputs,
  config,
  ...
}:
{
  imports = with inputs; [
    stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    image = ./images/wp.png;
    polarity = "dark";
    base16Scheme = {
      base00 = "#16161a";
      base01 = "#212126";
      base02 = "#2a2a30";
      base03 = "#373740";
      base04 = "#676778";
      base05 = "#e9ecf2";
      base06 = "#e9ecf2";
      base07 = "#e9ecf2";
      base08 = "#f25c5c";
      base09 = "#ff9c6a";
      base0A = "#ff9c6a";
      base0B = "#55b682";
      base0C = "#7aaaff";
      base0D = "#f17ac6";
      base0E = "#B87AFF";
      base0F = "#9595ab";
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
      sizes.terminal = 13;
    };
    targets = {
      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
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
  qt.enable = true;
}
