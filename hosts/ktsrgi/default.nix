{ pkgs, ... }:
{
  system.stateVersion = "24.05";
  environment.packages = with pkgs; [
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

  home-manager.config = {
    home.stateVersion = "24.05";
    imports = [
      ./programs/fastfetch
      ../../home/hezaki/themes
      ../../home/hezaki/programs/terminal/tmux
      ../../home/hezaki/programs/terminal/shell/zsh
      ../../home/hezaki/programs/terminal/shell/translate-shell
      ../../home/hezaki/programs/terminal/editors/neovim
    ];
  };
}
