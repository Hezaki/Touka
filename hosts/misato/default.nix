{
  nix-on-droid =
    { pkgs, ... }: {

      environment.packages = with pkgs; [
        neovim
        zsh
        neofetch
        git
        openssh
      ];

      system.stateVersion = "22.11";
    };
}
