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
      base00 = "#141312";
      base01 = "#1E1D1C";
      base02 = "#242321";
      base03 = "#32302f";
      base04 = "#fdf8f6";
      base05 = "#dad8d2";
      base06 = "#fdf8f6";
      base07 = "#fcefdd";

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
      package = pkgs.papirus-icon-theme;

      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    fonts = {
      serif = {
        name = "JetBrainsMono NerdFont";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      monospace = config.stylix.fonts.serif;
      emoji.package = pkgs.noto-fonts-color-emoji;
      sizes.terminal = 19;
    };

    targets = {
      rio.fonts.enable = false;
      tmux.enable = false;
      swaync.enable = false;
      neovim.enable = false;
      firefox.profileNames = [ "hqzk" ];

      # zen-browser.profileNames = [
      #   "hqzk"
      #   # "russl"
      # ];
    };
  };

  gtk = {
    enable = true;
    gtk4.enable = true;
  };

  qt.enable = true;
}
