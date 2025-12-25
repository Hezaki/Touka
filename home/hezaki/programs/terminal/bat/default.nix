{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "changes";
    };
    extraPackages = with pkgs.bat-extras; [ prettybat ];
  };
}
