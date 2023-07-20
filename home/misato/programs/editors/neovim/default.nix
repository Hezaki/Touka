{ ... }: {
  home.file = {
    ".config/nvim/init.lua".source = ./init.lua;
    ".config/nvim/lua".source = ./lua;
  };
}
