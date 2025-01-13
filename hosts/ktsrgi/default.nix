{ pkgs, ... }:
{
  system.stateVersion = "24.05";
  enviroment.packages = with pkgs; [
    fd
    duf
    tgpt
    ncdu
    cava
    lutgen
    joshuto
    ripgrep
    btop
    onefetch
    fastfetch
    home-manager
  ];

  imports = [
    ./programs/fastfetch
    ../../home/hezaki/programs/terminal/tmux
    ../../home/hezaki/programs/terminal/shell/zsh
    ../../home/hezaki/programs/terminal/shell/translate-shell
    ../../home/hezaki/programs/terminal/editors/neovim
  ];
}
