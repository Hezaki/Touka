{ lib, inputs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    # plugins = with inputs; {
    #   no-status = "${yazi-plugins}/no-status.yazi";
    # };
    # initLua = ''
    #   require("no-status"):setup()
    # '';
    settings = {
      manager.show_symlink = true;
    };
    theme = lib.mkForce {
      manager = {
        border_style = {
          fg = "black";
        };
      };
    };
  };
}
