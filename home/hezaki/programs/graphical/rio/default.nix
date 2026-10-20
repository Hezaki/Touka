{
  programs.rio = {
    enable = true;

    settings = {
      confirm-before-quit = false;
      copy-on-select = true;
      use-drawable-chars = false;
      editor.program = "vi";
      effects.trail-cursor = false;

      fonts = {
        size = 26;
        family = "JetBrainsMono Nerd Font";
        use-drawable-chars = true;
      };

      cursor = {
        shape = "beam";
        blinking = false;
      };

      bindings.keys = [
        {
          key = "space";
          "with" = "control | shift";
          action = "ToggleVIMode";
        }

        {
          key = "esc";
          mode = "vi";
          action = "ToggleVIMode";
        }

        {
          key = "alt";
          "with" = "enter";
          action = "SplitDown";
        }
      ];
    };
  };
}
