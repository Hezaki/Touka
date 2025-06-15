{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
    extraConfig = ''
      confirm_os_window_close 0
      disable_ligatures never
      cursor_trail 3
    '';
  };
}
