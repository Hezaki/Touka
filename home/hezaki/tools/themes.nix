{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ 
    gruvbox-gtk-theme
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
