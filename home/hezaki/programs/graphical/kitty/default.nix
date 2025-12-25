{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    extraConfig = ''
      confirm_os_window_close 0
      disable_ligatures never
      cursor_trail 3
    '';
  };
}
