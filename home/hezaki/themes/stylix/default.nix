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
    image = ../images/wp.png;
    polarity = "dark";
    enableReleaseChecks = false;

    base16Scheme = {
      # main colors
      base00 = "#12140E";
      base01 = "#1E201A";
      base02 = "#252622";
      base03 = "#30312c";
      base04 = "#dbe7c8";
      base05 = "#bfcbad";
      base06 = "#dbe7c8";
      base07 = "#f9faef";

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
      size = 15;
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
      sizes.terminal = 15;
    };

    targets = {
      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
      nixcord.enable = false;
      firefox.profileNames = [ "hqzk" ];
      zen-browser.profileNames = [ "hqzk" ];
    };
  };

  gtk = {
    enable = true;
    gtk4.enable = true;
  };

  qt.enable = true;
}
