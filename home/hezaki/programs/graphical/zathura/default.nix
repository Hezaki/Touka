{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set font JetBrainsMono
      set selection-clipboard clipboard
      set guioptions none

      map D set "first-page-column 1:2"
      map D set "guioptions"
      map j feedkeys "<C-Down>"
      map k feedkeys "<C-Up>"
    '';
  };
}
