{ pkgs, config, inputs, ... }: {

  environment.packages = with pkgs; [
    neovim
    ranger
    tmux
    neofetch
    gcc
    openssh
    git
    python312
    lua
  ];

  home-manager = {
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
  };

  time.timeZone = "Europa/Samara";
  user.shell = "${pkgs.zsh}/bin/zsh";

  system.stateVersion = "23.05";

  home-manager.config =
    { pkgs, ... }:
    {
      home.stateVersion = "22.05";
      imports = [
        ../../home/misato/programs/shell
        ../../home/misato/programs/neofetch 
        ../../home/misato/programs/ranger 
        ../../home/misato/programs/tmux 
      ];
    };
}
