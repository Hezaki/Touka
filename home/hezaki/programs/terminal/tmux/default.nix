{
  inputs,
  config,
  pkgs,
  ...
}:
with pkgs;
let
  tilish = tmuxPlugins.mkTmuxPlugin {
    pluginName = "tilish";
    version = "fake";
    src = inputs.tmux-tilish;
  };

  smooth-scroll = tmuxPlugins.mkTmuxPlugin {
    pluginName = "smooth-scroll";
    version = "fake";
    src = inputs.tmux-smooth-scroll;
  };
in
{
  programs.tmux = {
    enable = true;
    plugins = [
      { plugin = tilish; }

      {
        plugin = smooth-scroll;
        extraConfig = "set -g @smooth-scroll-mouse true";
      }
    ];

    mouse = true;
    prefix = "C-a";
    clock24 = true;
    escapeTime = 0;
    baseIndex = 1;
    historyLimit = 5000;
    keyMode = "vi";
    sensibleOnTop = true;
    disableConfirmationPrompt = true;
    customPaneNavigationAndResize = true;
    focusEvents = true;

    extraConfig = with config.lib.stylix.colors; ''
      bind r set -g status

      bind-key -T copy-mode-vi "v" send -X begin-selection
      bind-key -T copy-mode-vi "y" send -X copy-selection

      setw -g pane-base-index 2
      set -g status on
      set -g status-justify absolute-centre
      set -g status-position bottom
      set -g status-style "default"
      set -g status-right-length 50
      set -g status-left-length 20
      set -sa terminal-overrides "*:Tc"
      set -gq allow-passthrough on

      set -g status-left-length 90
      set -g status-right-length 90
      set -g status-left "#{tmux_mode_indicator}"
      set -g status-right " #(whoami) "

      set -g @mode_indicator_prefix_prompt " WAIT "
      set -g @mode_indicator_copy_prompt " COPY "
      set -g @mode_indicator_sync_prompt " SYNC "
      set -g @mode_indicator_empty_prompt " TMUX "

      set -g default-terminal "tmux-256color"
      set-option -sa terminal-features ',xterm-kitty:RGB'
      set-option -ga terminal-features ",xterm-kitty:usstyle"

      set -g popup-border-lines "rounded"

      set-window-option -g window-status-current-format " #I:#W "
      set-window-option -g window-status-format " #I:#W "

      set -g copy-mode-selection-style "fg=#${base04},bg=#${base02}"
      set-window-option -g window-status-current-style fg=#${base04}
      set-window-option -g window-status-style fg=#${base03}
      set -g window-active-style fg=#${base04}
      set -g popup-style "fg=#${base0B}"
      set -g popup-border-style "fg=#${base02}"
      set -g pane-border-style "fg=#${base02}"
      set -g pane-active-border-style "fg=#${base03}"
      set -g status-style bg=#${base00}

      set -g @mode_indicator_prefix_mode_style 'bg=#${base00},fg=color13'
      set -g @mode_indicator_copy_mode_style 'bg=#${base00},fg=color3'
      set -g @mode_indicator_sync_mode_style 'bg=#${base00},fg=color14'
      set -g @mode_indicator_empty_mode_style 'bg=#${base00},fg=color4'
    '';
  };
}
