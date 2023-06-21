{ pkgs, ... }: {

  environment.packages = with pkgs; [
    neovim
    zsh
    neofetch
  ];

  system.stateVersion = "22.11";
}
