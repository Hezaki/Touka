{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    papirus-icon-theme
  ];

  gtk = {
    enable = true;
    font.name = "JetBrainsMono 11";
    theme = {
      name = "gruvbox";
    };
    cursorTheme = {
      name = "gruvboxc";
      size = 24;
    };
    iconTheme = {
      name = "papirus-icon-theme";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.sessionVariables = {
    XCURSOR_THEME="gruvboxc";
    XCURSOR_SIZE="24";
  };
}
