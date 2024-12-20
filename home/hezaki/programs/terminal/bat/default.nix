{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "numbers,changes";
    };
    extraPackages = with pkgs.bat-extras; [
      prettybat
      batman
      # batdiff
    ];
  };
}
