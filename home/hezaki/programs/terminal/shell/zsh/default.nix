{
  pkgs,
  inputs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && exec niri-session -l
    '';

    plugins = with inputs; [
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugins.zsh";
        src = zsh-vi-mode;
      }

      {
        name = "zsh-history-substring-search";
        file = "zsh-history-substring-search.plugin.zsh";
        src = zsh-syntax-highlighting;
      }

      {
        name = "fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = fzf-tab;
      }

      {
        name = "zsh-auto-notify";
        file = "auto-notify.plugin.zsh";
        src = zsh-auto-notify;
      }

      {
        name = "zsh-autopair";
        file = "zsh-autopair.plugin.zsh";
        src = zsh-autopair;
      }
    ];

    shellAliases = {
      "l" = "ls -l";
      "cd" = "z";
      "cdi" = "zi";
      "cat" = "bat";
      "tree" = "lsd --tree";
      "doas" = "doas ";
      "sudo" = "sudo ";
      "df" = "duf";
      "md" = "mkdir -v";
      "mv" = "mv -v";
      "cp" = "cp -v";
      "gpp" = "g++";
      "tsh" = "trans -shell";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      ":q" = "exit";
      ":wq" = "exit";
      "mpv" = "mpv --loop";
      "fb" = "fastboot";
      "si" = "swayimg";
      "cd 206b-0B1E" = "cd /run/media/hezaki/206B-0B1E";
      "neofetch" = "fastfetch -c neofetch";
      "pizdafetch" = "fastfetch -c examples/13";
      "rm" = "gomi ";
    };

    initContent = ''
      setopt automenu
      setopt nobeep

      export EDITOR='nvim'
      export AUTO_NOTIFY_THRESHOLD=60
      export AUTO_NOTIFY_TITLE="Hey! "%command" has just finished"
      export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
      export ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline 

      export ZVM_SYSTEM_CLIPBOARD_ENABLED=true
      export ZVM_CLIPBOARD_COPY_CMD='wl-copy'
      export ZVM_CLIPBOARD_PASTE_CMD='wl-paste'
      export ZVM_VI_EDITOR=nvim

      typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
      typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

      bindkey '^H' vi-backward-kill-word
      bindkey '^w' vi-backward-kill-word
      bindkey '^[[1;5C' vi-forward-word
      bindkey '^[[1;5D' vi-backward-word
      bindkey '^f' beginning-of-line

      export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
      export FZF_DEFAULT_OPTS="--height 50% --layout=default --border"
      export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
      export FZF_ALT_C_OPTS="--preview 'ls | head -200'"
      export FZF_TMUX_OPTS=" -p90%,70% "  

      zstyle ":completion:*" menu no
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
      zstyle ":fzf-tab:*" fzf-flags \
        -e \
        -i \
        --algo=v1 \
        --no-mouse \
        -m \
        --height=20 \
        --reverse \
        --no-scrollbar \
        --pointer=">"
      zstyle ":fzf-tab:*" fzf-bindings "space:accept"
      zstyle ":fzf-tab:*" accept-line enter

      _fix_cursor() {
        echo -ne "\033[5 q"
      }
      precmd_functions+=(_fix_cursor)

      tmux run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode_indicator.tmux
    '';

    history.size = 10000;
  };
}
