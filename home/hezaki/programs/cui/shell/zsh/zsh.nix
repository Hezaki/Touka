{
  config, pkgs, inputs, ...
}: let
  username = "hezaki";
  email = "email";
in { 
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        ls = "lsd -F";
        l = "lsd -l";
        ll = "lsd -ll";
        la = "lsd -la";
        cat = "bat --theme gruvbox-dark";
        tree = "lsd --tree";
        doas = "doas ";
        sudo = "sudo ";
        Neorg = "vi $HOME/Notes/";
        box = "distrobox";
        md = "mkdir -v";
        rm = "rm -v";
        rmd = "rmdir -v";
        mv = "mv -v";
        cp = "cp -v";
        gpp = "g++";
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
        "cd ..." = "cd ../../";
        "cd ...." = "cd ../../../";
        ":q" = "exit";
        ":wq" = "exit";
        "flake-update" = "nix flake update";
        "nixos-update" = "doas nixos-rebuild switch";
        "home-update" = "home-manager switch --flake /etc/nixos/.";
      };
      # Plugins
      plugins = [
       {
         name = "powerlevel10k";
         src = pkgs.zsh-powerlevel10k;
         file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
       }
       {
         name = "zsh-autosuggestions";
         src = pkgs.zsh-autosuggestions;
         file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
       }
       {
         name = "zsh-history-substring-search";
         src = pkgs.zsh-history-substring-search;
         file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
       }
       {
         name = "zsh-autopair";
         src = pkgs.zsh-autopair;
         file = "share/zsh-autopair/zsh-autopair.zsh";
       }
       {
         name = "fzf-tab";
         src = pkgs.zsh-fzf-tab;
         file = "share/fzf-tab/fzf-tab.zsh";
       }
       {
         name = "zsh-syntax-highlighting";
         src = pkgs.zsh-syntax-highlighting;
         file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
       }
       {
         name = "zsh-autopair";
         src = pkgs.zsh-autopair;
         file = "share/zsh/zsh-autopair/autopair.zsh";
       }
      ];
      # Config
      initExtra = ''
        export EDITOR='nvim'
        export AUTO_NOTIFY_THRESHOLD=60
        export AUTO_NOTIFY_TITLE="%command finished"

        bindkey '^H' vi-backward-kill-word
        bindkey '^w' vi-backward-kill-word
        bindkey '^[[1;5C' vi-forward-word
        bindkey '^[[1;5D' vi-backward-word
        bindkey '^f' beginning-of-line

        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"

        export FZF_DEFAULT_OPTS=" \
        --color=bg+:#1e1e2e,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
        
        _fix_cursor() {
           echo -ne "\033[4 q"
        }
        precmd_functions+=(_fix_cursor)

        if command -v fzf-share >/dev/null; then
          source "$(fzf-share)/key-bindings.zsh"
          source "$(fzf-share)/completion.zsh"
        fi

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

        source /etc/nixos/home/hezaki/programs/cui/shell/zsh/local/zsh-auto-notify/auto-notify.plugin.zsh
        # tmux plugin
        sh /etc/nixos/home/hezaki/programs/cui/tmux/local/mode_indicator.tmux

        [[ ! -f /home/hezaki/.p10k.zsh ]] || source /home/hezaki/.p10k.zsh
      '';
      history = {
        size = 10000;
      };
    };
    # Utilites
    git = {
      enable = true;
      userName  = username;
      userEmail = email;
      aliases = {
        s = "status";
      };
    };
    bat = {
      enable = true;
    };
    lsd = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
  };
}
