{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    plugins =
      let
        p = pkgs.fishPlugins;
      in
      [
        {
          name = "done";
          src = p.done.src;
        }

        {
          name = "fifc";
          src = p.fifc.src;
        }

        {
          name = "sponge";
          src = p.sponge.src;
        }

        # {
        #   name = "autopair";
        #   src = p.autopair.src;
        # }
      ];

    shellAbbrs = {
      "l" = "ls -l";
      "l1" = "ls -1";
      "la" = "ls -la";
      "ll" = "ls -ll";
      "cd" = "z";
      "cdi" = "zi";
      "cat" = "bat";
      "tree" = "lsd --tree";
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
      "neofetch" = "fastfetch -c neofetch";
      "pizdafetch" = "fastfetch -c examples/13";
      "rm" = "gomi";
    };

    interactiveShellInit = ''
      set fish_greeting
      fish_vi_key_bindings

      set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
      set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
      set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
      set -gx FZF_DEFAULT_OPTS "--height 50% --layout=default --border"
      set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always -n --line-range :500 {}'"
      set -gx FZF_ALT_C_OPTS "--preview 'ls | head -200'"
      set -gx FZF_TMUX_OPTS " -p90%,70% "
    '';
  };
}
