{ inputs, pkgs, ... }:{
  imports = [
    inputs.neovim-flake.homeManagerModules.default
  ];

  programs.neovim-flake = {
    enable = true;
    settings = {
      vim = {
        package = pkgs.neovim-unwrapped;
        viAlias = true;
        enableLuaLoader = true;
        useSystemClipboard = true;
        cmdHeight = 0;
        lsp = {
          enable = true;
          formatOnSave = true;
          lspkind = {
            enable = true;
            mode = "symbol_text";
          };
          lspsaga = {
            enable = true;
          };
          lightbulb.enable = true;
        };
      };
    };
  };
}
