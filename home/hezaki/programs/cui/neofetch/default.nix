{ ... }: {
  home.file = {
    ".config/neofetch/config.conf".source = ./config.conf;
    ".config/neofetch/arch.conf".source = ./arch.conf;
    ".config/neofetch/alpine.conf".source = ./alpine.conf;
  };
}
