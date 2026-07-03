{ inputs, ... }:

{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    clearDefaultKeybinds = true;

    settings = {
      window-padding-x = "4,4";
      window-padding-y = "4,0";
      confirm-close-surface = false;
      window-padding-balance = true;
      copy-on-select = "clipboard";
      keybind = [
        "ctrl+shift+y=copy_to_clipboard"
        "ctrl+shift+p=paste_from_clipboard"
        "ctrl+shift+plus=increase_font_size:1"
        "ctrl+shift+minus=decrease_font_size:1"
      ];

      custom-shader = "${inputs.ghostty-cursor-shaders}/cursor_warp.glsl";
    };
  };
}
