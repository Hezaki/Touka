{ ... }: {
  home.file = { 
    ".config/ranger/commands.py".source = ./config/commands.py;
    ".config/ranger/plugins".source = ./config/plugins;
    ".config/ranger/rc.conf".source = ./config/rc.conf;
  };
}
