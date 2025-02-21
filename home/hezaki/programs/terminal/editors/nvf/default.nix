{ inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme.enable = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
        };
      };
    };
  };
}
