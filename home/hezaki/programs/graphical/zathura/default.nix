{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font JetBrainsMono
      set font 12
      set selection-clipboard clipboard
      set guioptions ""

      map D set "first-page-column 1:1"
      map <C-d> set "first-page-column 1:2"
    '';
  };
}
