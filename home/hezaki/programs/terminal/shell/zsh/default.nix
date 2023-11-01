{ pkgs, ... }: let
  username = "username";
  email = "email";
in { 
  programs = {
    zsh = {
      enable = true;
      profileExtra = ''
        [ "$(tty)" = "/dev/tty1" ] && exec Hyprland
      '';
      shellAliases = {
        ls = "lsd -F";
        l = "lsd -l";
        ll = "lsd -ll";
        la = "lsd -lA";
        cd = "z";
        tree = "lsd --tree";
        doas = "doas ";
        sudo = "sudo ";
        box = "distrobox";
        md = "mkdir -v";
        rm = "rm -v";
        rmd = "rmdir -v";
        mv = "mv -v";
        cp = "cp -v";
        gpp = "g++";
        eng = "trans :en -shell -brief -no-auto -e google";
        rus = "trans :ru -shell -brief -no-auto -e google";
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
        ":q" = "exit";
        ":wq" = "exit";
        "flake-update" = "nix flake update /etc/nixos";
        "nixos-update" = "doas nixos-rebuild switch";
        "home-update" = "home-manager switch --flake /etc/nixos/.";
      };
      # Plugins
      plugins = with pkgs; [
        {
          name = "powerlevel10k";
          src = zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "zsh-autosuggestions";
          src = zsh-autosuggestions;
          file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        }
        {
          name = "zsh-history-substring-search";
          src = zsh-history-substring-search;
          file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
        }
        {
          name = "fzf-tab";
          src = zsh-fzf-tab;
          file = "share/fzf-tab/fzf-tab.zsh";
        }
        {
          name = "zsh-syntax-highlighting";
          src = zsh-syntax-highlighting;
          file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        }
      ] ++ [
        {
          name = "zsh-auto-notify";
          file = "auto-notify.plugin.zsh";
          src = fetchFromGitHub {
            owner = "MichaelAquilina";
            repo = "zsh-auto-notify";
            rev = "22b2c61ed18514b4002acc626d7f19aa7cb2e34c";
            hash = "sha256-x+6UPghRB64nxuhJcBaPQ1kPhsDx3HJv0TLJT5rjZpA=";
          };
        }
      ];
      # Config
      initExtra = ''
        export EDITOR='nvim'
        export AUTO_NOTIFY_THRESHOLD=60
        export AUTO_NOTIFY_TITLE="%command finished"
        export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
        export ZVM_VI_HIGHLIGHT_BACKGROUND=#313244
        export ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline 

        bindkey -v
        bindkey '^H' vi-backward-kill-word
        bindkey '^w' vi-backward-kill-word
        bindkey '^[[1;5C' vi-forward-word
        bindkey '^[[1;5D' vi-backward-word
        bindkey '^f' beginning-of-line

        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=black"

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

        tmux run-shell ${pkgs.tmuxPlugins.mode-indicator}/share/tmux-plugins/mode-indicator/mode_indicator.tmux

        [[ ! -f /home/hezaki/.p10k.zsh ]] || source /home/hezaki/.p10k.zsh
      '';
      history = {
        size = 10000;
      };
    };
    git = {
      enable = true;
      userName  = username;
      userEmail = email;
      aliases = {
        s = "status";
      };
    };
    fzf.enable = true;
    lsd.enable = true;
    zoxide.enable = true;
  };
}
