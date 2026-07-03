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
      # main colors
      base00 = "#131318";
      base01 = "#1b1b22";
      base02 = "#202029";
      base03 = "#464653";
      base04 = "#e3e1f6";
      base05 = "#c7c5d8";
      base06 = "#e3e1f6";
      base07 = "#f3f0ff";

      # syntax colors
      base08 = "#ffb3ab";
      base09 = "#f5bc74";
      base0A = "#e2c45c";
      base0B = "#80d6a3";
      base0C = "#4ecde3";
      base0D = "#adc6ff";
      base0E = "#d1bcff";
      base0F = "#ffb2cc";
    };

    cursor = {
      name = "Bibata-Modern-Custom";
      package =
        inputs.nix-cursors.packages.${pkgs.stdenv.hostPlatform.system}.bibata-modern-cursor.override
          {
            background_color = "#${config.lib.stylix.colors.base00}";
            outline_color = "#${config.lib.stylix.colors.base06}";
            accent_color = "#${config.lib.stylix.colors.base00}";
          };
      size = 17;
    };

    icons = {
      enable = true;

      dark = "Papirus-Dark";
      light = "Papirus-Light";

      package = pkgs.papirus-icon-theme;
    };

    fonts = {
      serif = {
        name = "JetBrainsMono NerdFont";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-color-emoji;
      sizes.terminal = 18;
    };

    targets = {
      gtk.extraCss = ''
        window {
          border-radius: 16px;
        }
      '';

      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
      nixcord.enable = false;
      firefox.profileNames = [ "hqzk" ];
    };
  };

  gtk = {
    enable = true;
    gtk4.enable = true;
  };

  qt.enable = true;
}
