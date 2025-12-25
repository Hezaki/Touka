{
  pkgs,
  inputs,
  config,
  ...
}:
{
  programs.zsh = {
    enable = true;

    profileExtra = ''
      [ "$(tty)" = "/dev/tty1" ] && exec niri-session -l
    '';

    plugins = with inputs; [
      {
        name = "powerlevel10k";
        file = "powerlevel9k.zsh-theme";
        src = powerlevel10k;
      }

      {
        name = "zsh-autosuggestions";
        file = "zsh-autosuggestions.plugin.zsh";
        src = zsh-autosuggestions;
      }

      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.plugin.zsh";
        src = zsh-syntax-highlighting;
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
    };

    initContent = with config.lib.stylix.colors; ''
      setopt automenu
      setopt nobeep

      export EDITOR='nvim'
      export AUTO_NOTIFY_THRESHOLD=60
      export AUTO_NOTIFY_TITLE="Hey! "%command" has just finished"
      export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
      export ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline 
      export GEMINI_API_KEY="AIzaSyDfTko2FQVo-5KMN4yfH7bBU51h8fMm1DU"

      typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
      typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

      bindkey -v
      bindkey '^H' vi-backward-kill-word
      bindkey '^w' vi-backward-kill-word
      bindkey '^[[1;5C' vi-forward-word
      bindkey '^[[1;5D' vi-backward-word
      bindkey '^f' beginning-of-line

      export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${base03}"

      export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
      export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=fg+:#${base02}"
      export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
      export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
      export FZF_TMUX_OPTS=" -p90%,70% "  

      zstyle ":completion:*" menu no
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
         echo -ne "\033[4 q"
      }
      precmd_functions+=(_fix_cursor)

      xf ()
      {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *.deb)       ar x $1      ;;
            *.tar.xz)    tar xf $1    ;;
            *.tar.zst)   tar xf $1    ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }

      tmux run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode_indicator.tmux
      
      [[ ! -f /home/hezaki/.p10k.zsh ]] || source /home/hezaki/.p10k.zsh
    '';

    history.size = 10000;
  };
}
