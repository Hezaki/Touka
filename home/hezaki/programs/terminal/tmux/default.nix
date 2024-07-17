{ pkgs, config, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1; 
    keyMode = "vi";
    sensibleOnTop = true;
    disableConfirmationPrompt = true;
    customPaneNavigationAndResize = true;
    extraConfig =
    ''
      set-option -g prefix C-a

      bind r set -g status

      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi "v" send -X begin-selection
      bind-key -T copy-mode-vi "y" send -X copy-selection

      set -g base-index 1 
      setw -g pane-base-index 2
      set -g status on
      set -g status-justify left
      set -g status-position bottom
      set -g status-style "default"
      set -g status-right-length 50
      set -g status-left-length 20
      set -sa terminal-overrides "*:Tc"

      set -g status-left "#{tmux_mode_indicator} "
      set -g status-right ' '

      set -g @mode_indicator_prefix_prompt " WAIT "
      set -g @mode_indicator_copy_prompt " COPY "
      set -g @mode_indicator_sync_prompt " SYNC "
      set -g @mode_indicator_empty_prompt " TMUX "
      
      set -g pane-border-style "fg=#${config.lib.stylix.colors.base02}"
      set -g pane-active-border-style "fg=#${config.lib.stylix.colors.base02}"
      set -g mode-style "bg=color0 fg=yellow" 
      set -g status-style bg=color0

      set -g @mode_indicator_prefix_mode_style 'bg=color,fg=color13'
      set -g @mode_indicator_copy_mode_style 'bg=color,fg=color3'
      set -g @mode_indicator_sync_mode_style 'bg=color,fg=color14'
      set -g @mode_indicator_empty_mode_style 'bg=color,fg=color4'
    '';
    plugins = with pkgs.tmuxPlugins; [
      pain-control
      mode-indicator
      yank
    ];
  };
}
