{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font JetBrainsMono
      set selection-clipboard clipboard
      set guioptions none

      map D set "first-page-column 1:2"
    '';
  };
}
