{ lib, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    keymap = {
      manager.prepend_keymap = [
        {
          run = "shell 'ripdrag -A ''$@'' -x 2>/dev/null &' --confirm";
          on = [ "<C-n>" ];
        }
        {
          run = "quit";
          on = [ "<Esc>" ];
        }
      ];
    };
    settings = {
      mgr = {
        show_symlink = true;
        sort_by = "size";
        linemode = "size";
      };
    };
    theme = lib.mkForce {
      manager = {
        border_style = {
          fg = "black";
        };
      };
    };
  };
}
