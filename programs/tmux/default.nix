{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; with tmuxPlugins; [
      sensible
      pain-control
      yank
    ];
    extraConfig = ''
      set-option -g prefix C-a

      set -g status on
      set -g status-justify left
      set -g status-position bottom
      set -g status-style "default"
      set -g status-right-length 50
      set -g status-left-length 20
      set -sa terminal-overrides "*:Tc"

      set -g status-left "#{tmux_mode_indicator} "
      set -g status-right '%H:%M:%S  %a %h-%d '

      set -g mouse on

      set -g @mode_indicator_prefix_prompt " WAIT "
      set -g @mode_indicator_copy_prompt " COPY "
      set -g @mode_indicator_sync_prompt " SYNC "
      set -g @mode_indicator_empty_prompt " TMUX "
      
      set -g pane-border-style "fg=color0"
      set -g pane-active-border-style "bg=default fg=color0"

      set -g @mode_indicator_prefix_mode_style 'bg=color,fg=color10'
      set -g @mode_indicator_copy_mode_style 'bg=color,fg=color3'
      set -g @mode_indicator_sync_mode_style 'bg=color,fg=color14'
      set -g @mode_indicator_empty_mode_style 'bg=color,fg=color4'

      set -g @yank_with_mouse on
    '';
  };
}
