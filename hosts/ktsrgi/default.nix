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
    ../../hezaki/programs/terminal/tmux
    ../../hezaki/programs/terminal/shell/zsh
    ../../hezaki/programs/terminal/shell/translate-shell
    ../../hezaki/programs/terminal/editors/neovim
  ];
}
