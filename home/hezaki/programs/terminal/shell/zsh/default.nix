{ pkgs, inputs, config, ... }:
{ 
  programs = {
    zsh = {
      enable = true;
      profileExtra = ''
        [ "$(tty)" = "/dev/tty1" ] && exec Hyprland
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
          name = "zsh-history-substring-search";
          file = "zsh-history-substring-search.plugin.zsh";
          src = zsh-syntax-highlighting;
        }
        {
          name = "zsh-syntax-highlighting";
          file = "zsh-syntax-highlighting.plugin.zsh";
          src = zsh-syntax-highlighting;
        }
        {
          name = "fzf-tab";
          file = "fzf-tab.plugin.zsh";
          src = fzf-tab;
        }
        {
          name = "zsh-auto-notify";
          file = "zsh-auto-notify.plugin.zsh";
          src = zsh-auto-notify;
        }
      ];
      shellAliases = {
        "cd" = "z";
        "cat" = "bat";
        "tree" = "lsd --tree";
        "doas" = "doas ";
        "sudo" = "sudo ";
        "fetch" = "fastfetch";
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
        "flake-update" = "nix flake metadata --json /etc/nixos | nix run nixpkgs#jq '.locks.nodes.root.inputs[]' | sed 's/\"//g' | fzf";
        "nixos-update" = "NIXPKGS_ALLOW_UNFREE=1 doas nixos-rebuild switch --flake /etc/nixos/.#think --impure";
        "home-update" = "home-manager switch --flake /etc/nixos/.#hezaki";
      };
      initExtra = ''
        export EDITOR='nvim'
        export AUTO_NOTIFY_THRESHOLD=60
        export AUTO_NOTIFY_TITLE="%command finished"
        export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
        export ZVM_VI_HIGHLIGHT_BACKGROUND=#313244
        export ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline 
        export PURE_PROMPT_SYMBOL=""
        export PURE_PROMPT_VICMD_SYMBOL=""

        bindkey -v
        bindkey '^H' vi-backward-kill-word
        bindkey '^w' vi-backward-kill-word
        bindkey '^[[1;5C' vi-forward-word
        bindkey '^[[1;5D' vi-backward-word
        bindkey '^f' beginning-of-line

        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#${config.lib.stylix.colors.base03}"

        # export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
        # " --color=bg+:#${config.lib.stylix.colors.base00},bg:#${config.lib.stylix.colors.base00},"\

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
  };
}
