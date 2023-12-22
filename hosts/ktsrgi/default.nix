{ pkgs, inputs, ... }: {
  environment.packages = with pkgs; [
    neovim
    joshuto
    tmux
    fastfetch
    openssh
    git
    python312
  ];

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  time.timeZone = "Europa/Samara";
  user.shell = "${pkgs.zsh}/bin/zsh";

  system.stateVersion = "23.05";

  home-manager.config =
  {
    home.stateVersion = "22.05";
    imports = [
      ../../home/hezaki/programs/terminal/shell/zsh
      ../../home/hezaki/programs/terminal/tmux
      ../../home/misato/programs/fastfetch 
      ../../home/misato/programs/ranger 
    ];
  };
}
