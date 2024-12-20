{ pkgs, ... }:
{
  home = {
    username = "root";
    homeDirectory = "/root";
    stateVersion = "23.11";
    packages = with pkgs; [
      fd
      duf
      tgpt
      ncdu
      cava
      lutgen
      joshuto
      ripgrep
      htop-vim
      onefetch
      fastfetch
      home-manager
    ];
  };

  imports = [
    ./programs/fastfetch
    ../hezaki/programs/terminal/tmux
    ../hezaki/programs/terminal/shell/zsh
    ../hezaki/programs/terminal/shell/translate-shell
    # ../hezaki/programs/terminal/editors/neovim
  ];
}
