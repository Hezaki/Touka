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

  resurrect = tmuxPlugins.mkTmuxPlugin {
    pluginName = "resurrect";
    version = "fake";
    src = fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-resurrect";
      rev = "ca6468e2deef11efadfe3a62832ae67742505432";
      hash = "sha256-wl9/5XvFq+AjV8CwYgIZjPOE0/kIuEYBNQqNDidjNFo=";
      fetchSubmodules = true;
    };
  };

  continuum = tmuxPlugins.mkTmuxPlugin {
    pluginName = "continuum";
    version = "fake";
    src = inputs.tmux-continuum;
  };
in
{
  programs.tmux = {
    enable = true;

    plugins = [
      {
        plugin = tilish;
        extraConfig = "set -g @tilish-default 'main-vertical'";
      }

      {
        plugin = resurrect;
      }

      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15'
        '';
      }
    ];

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

    extraConfig = ''
      bind r set -g status

      bind-key -T copy-mode-vi "v" send -X begin-selection
      bind-key -T copy-mode-vi "y" send -X copy-selection

      setw -g pane-base-index 2
      set -g status on
      set -g status-justify left
      # set -g status-justify absolute-centre
      set -g status-position bottom
      set -g status-style "default"
      set -g status-right-length 50
      set -g status-left-length 20
      set -sa terminal-overrides "*:Tc"
      set -gq allow-passthrough on

      set -g status-left-length 90
      set -g status-left "#{tmux_mode_indicator} "
      set -g status-right ' '

      set -g @mode_indicator_prefix_prompt " WAIT "
      set -g @mode_indicator_copy_prompt " COPY "
      set -g @mode_indicator_sync_prompt " SYNC "
      set -g @mode_indicator_empty_prompt " TMUX "

      set -g default-terminal "tmux-256color"
      set-option -sa terminal-features ',xterm-kitty:RGB'
      set-option -ga terminal-features ",xterm-kitty:usstyle"

      set -g popup-border-lines "rounded"

      set -g popup-style "fg=#${config.lib.stylix.colors.base0B}"
      set -g popup-border-style "fg=#${config.lib.stylix.colors.base02}"
      set -g pane-border-style "fg=#${config.lib.stylix.colors.base02}"
      set -g pane-active-border-style "fg=#${config.lib.stylix.colors.base03}"
      set -g mode-style "bg=#${config.lib.stylix.colors.base00} fg=yellow" 
      set -g status-style bg=#${config.lib.stylix.colors.base00}

      set -g @mode_indicator_prefix_mode_style 'bg=#${config.lib.stylix.colors.base00},fg=color13'
      set -g @mode_indicator_copy_mode_style 'bg=#${config.lib.stylix.colors.base00},fg=color3'
      set -g @mode_indicator_sync_mode_style 'bg=#${config.lib.stylix.colors.base00},fg=color14'
      set -g @mode_indicator_empty_mode_style 'bg=#${config.lib.stylix.colors.base00},fg=color4'
    '';
  };
}
